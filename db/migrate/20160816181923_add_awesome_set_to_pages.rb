class AddAwesomeSetToPages < ActiveRecord::Migration
  def change
    add_column :pages, :parent_id, :integer, :null => true, :index => true
    add_column :pages, :lft, :integer, :null => false, :index => true
    add_column :pages, :rgt, :integer, :null => false, :index => true
    add_column :pages, :depth, :integer,  :null => false, :default => 0
    add_column :pages, :children_count, :integer, :null => false, :default => 0
  end
end
