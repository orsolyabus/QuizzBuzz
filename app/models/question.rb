class Question < ApplicationRecord
    belongs_to :quiz

    validates :question, presence: true, length: { maximum: 300}
    validates :option0, presence: true, length: { maximum: 100}
    validates :option1, presence: true, length: { maximum: 100}
    validates :option2, presence: true, length: { maximum: 100}
    validates :option3, presence: true, length: { maximum: 100}
    validates :correct_answer, 
        presence: true,
        numericality: { less_than: 4 }
end
