class LayoutPart < ActiveRecord::Base
  belongs_to :layout

  validates :name, presence: true


  def self.part_list
    Part.lists
  end

end
