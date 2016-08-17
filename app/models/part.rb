class Part < ActiveRecord::Base
  belongs_to :page
  acts_as_list scope: :page

  serialize :data

  scope :texts, -> { where(type: 'TextPart') }
  scope :sliders, -> { where(race: 'SliderPart') }


  validates :data, presence: true
  validates :page, presence: true

  after_initialize :check_data

  def check_data
    self.data ||= {}
  end

  def object_type
    self.type
  end

  def as_json(options={})
    super( (options || {}).merge({ :methods => [:object_type]}))
  end
end
