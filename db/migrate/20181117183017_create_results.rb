class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
      t.integer :score
      t.integer :attempts
      t.timestamps
    end
  end
end
