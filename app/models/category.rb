class Category < ActiveRecord::Base
  belongs_to :category
  has_many :categories
  has_many :working_scopes

  has_many :questions, -> { where scopes: 'questions' }

  def self.categories_by_scope
    scopes = ['questions','seminare','tutorials','test','books'].sort
    result = []
    for scope in scopes
      categories = Category.where(scope: scope)
      categories.each {|x| result << ["#{scope.capitalize} - #{x.full_name}", x.id]}
    end
    result
  end

  def full_name
    full = ""
    if category.present?
      full = category.full_name + " - "
    end
    return full + name
  end
end
