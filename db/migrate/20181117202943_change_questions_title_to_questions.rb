class ChangeQuestionsTitleToQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :title
    add_column :questions, :question, :string
  end
end
