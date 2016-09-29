class AddTemplateToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :template, :string
  end
end
