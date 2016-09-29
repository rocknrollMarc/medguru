class AddSolutionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :has_solution, :boolean
    add_column :questions, :solution, :text
  end
end
