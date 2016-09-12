class AddPublishedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :published, :boolean, default: false
    add_index :questions, :published
  end
end
