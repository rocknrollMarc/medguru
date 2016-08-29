class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :scope
      t.string :name
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :categories, :scope
  end
end
