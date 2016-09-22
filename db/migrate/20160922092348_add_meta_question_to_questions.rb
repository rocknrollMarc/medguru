class AddMetaQuestionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :meta_question, :boolean, default: false
    add_column :questions, :subquestion, :boolean, default: false
    add_column :questions, :question_id, :integer
    add_index :questions, :question_id
  end
end
