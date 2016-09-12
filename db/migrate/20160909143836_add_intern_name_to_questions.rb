class AddInternNameToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :intern_name, :string
    add_index :questions, :intern_name
  end
end
