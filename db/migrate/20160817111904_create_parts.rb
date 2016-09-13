class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.text :data
      t.integer :page_id
      t.string :type
      t.timestamps null: false
    end
    add_index :parts, :page_id
  end
end
