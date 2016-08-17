class Page < ActiveRecord::Base
  include TheSortableTree::Scopes
  has_many :parts, -> { order(position: :asc) }
  accepts_nested_attributes_for :parts, allow_destroy: true

  validates :layout, presence: true
  after_initialize :check_parts

  default_scope -> { includes(:parts) }

  def check_parts
    if parts.blank?
      parts << TextPart.new
    end
  end

end
