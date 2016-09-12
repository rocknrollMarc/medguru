class CreateWorkingScopes < ActiveRecord::Migration
  def change
    create_table :working_scopes do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :working_scopes, :user_id
    add_index :working_scopes, :category_id
    add_index :working_scopes, [:user_id, :category_id], :unique => true
  end
end
