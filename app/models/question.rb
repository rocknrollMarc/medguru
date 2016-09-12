class Question < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :answers, dependent: :destroy


  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['body'].blank? }, :allow_destroy => true

  validates :intern_name, presence: true
  validates :body, presence: true
  validates :answers, length: { minimum: 2 }
  validates :difficulty, presence: true
  validate :has_correct_answer

  def has_correct_answer
    errors.add(:base, 'muss genau eine richtige Antwort haben') if self.answers.map {|x| x.correct_answer}.reject(&:blank?).length != 1
  end

  def owner
    activities.first.owner.try(:name) || activities.first.owner.try(:email)
  end

  def status
    "Unpublished"
  end

  def category

  end


end
