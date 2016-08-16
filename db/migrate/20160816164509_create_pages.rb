class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.string :meta_description
      t.string :open_graph_title
      t.string :open_graph_type
      t.string :open_graph_image
      t.string :open_graph_video
      t.timestamps null: false
    end
    add_index :pages, :slug, unique: true
  end
end
