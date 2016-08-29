class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct_answer
      t.references :question, index: true
      t.timestamps null: false
    end
  end
end
