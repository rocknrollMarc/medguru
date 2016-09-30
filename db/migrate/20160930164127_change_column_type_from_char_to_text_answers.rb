class ChangeColumnTypeFromCharToTextAnswers < ActiveRecord::Migration
  def up
      change_column :answers, :body, :text
  end
  def down
      change_column :answers, :body, :string
  end
end
