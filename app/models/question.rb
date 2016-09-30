class Question < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :question
  belongs_to :category

  accepts_nested_attributes_for :answers, :allow_destroy => true
  accepts_nested_attributes_for :questions, :allow_destroy => true


  validates :intern_name, presence: true, unless: :subquestion
  validates :category_id, presence: true, unless: :subquestion

  validates :reference_image, presence: true, if: :has_image
  validates :perspective_image, presence: true, if: :has_perspective
  validates :downloadable, presence: true, if:  :has_downloadable
  validates :solution, presence: true, if:  :has_solution
  validates :source, presence: true, if:  :has_source


  validates :body, presence: true
  validates :answers, length: { minimum: 2 }, unless: :meta_question
  validates :difficulty, presence: true, unless: :meta_question
  validate :has_correct_answer, unless: :meta_question

  validates :questions, length: { minimum: 1 }, if: :meta_question

  mount_uploader :downloadable, FileUploader
  mount_uploader :perspective_image, QuestionImageUploader
  mount_uploader :reference_image, QuestionImageUploader


  def has_correct_answer
    errors.add(:answers, 'muss genau eine richtige Antwort haben') if self.answers.map {|x| x.correct_answer}.reject(&:blank?).length != 1
  end

  def self.category_leafs
    return @my_cat if @my_cat.present?
    @my_cat ||=Category.where(scope: 'questions').joins("LEFT JOIN categories AS children ON categories.id = children.category_id").where("children.id IS NULL")
    @my_cat = @my_cat.map{|m| [m.full_name, m.id]}
  end


  def owner
    activities.first.owner.try(:name) || activities.first.owner.try(:email)
  end

  def status
    "Unpublished"
  end


  def calculated_difficulty
    if meta_question
      begin
        questions.sum(:difficulty) / questions.length
      rescue
        0
      end
    else
      difficulty
    end
  end


end
