class CreateLayoutParts < ActiveRecord::Migration
  def change
    create_table :layout_parts do |t|
      t.string :name
      t.integer :layout_id
      t.integer :position
      t.timestamps null: false
    end
    add_index :layout_parts, :layout_id
  end
end
