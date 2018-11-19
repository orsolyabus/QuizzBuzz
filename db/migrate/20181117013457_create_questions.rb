class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :option0
      t.string :option1
      t.string :option2
      t.string :option3
      t.integer :correct_answer
      t.timestamps
    end
  end
end
