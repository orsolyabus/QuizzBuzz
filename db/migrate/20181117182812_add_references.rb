class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :user, foreign_key: true
    add_reference :questions, :quiz, foreign_key: true
  end
end
