class Layout < ActiveRecord::Base

  has_many :layout_parts, dependent: :destroy
  accepts_nested_attributes_for :layout_parts, reject_if: proc { |attributes| attributes['name'].blank? }, :allow_destroy => true

  validates :name, :presence => true
  validates :template, :presence => true

end
