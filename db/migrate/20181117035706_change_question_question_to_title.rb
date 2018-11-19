class ChangeQuestionQuestionToTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :title, :string
    remove_column :questions, :question, :string
  end
end
