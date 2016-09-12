class WorkingScope < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates_uniqueness_of :category_id, :scope => :user_id
  validates :category, :presence => true
  validates :user, :presence => true
end
