class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['body'].blank? }
  validates :answers, :length => { :minimum => 2 }
end
