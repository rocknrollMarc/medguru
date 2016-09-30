class AddSourceToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :has_source, :boolean
    add_column :questions, :source, :text
  end
end
