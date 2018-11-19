class User < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :quizzes, dependent: :nullify
    has_many :quiz_taken, through: :results, source: :quiz
    
    has_secure_password 


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

        #    validates :first_name, presence: true,
        #    validates :last_name, presence: true,
    validates :nickname, presence: true, uniqueness: true
    validates :email, presence: true, 
        uniqueness: true,
        format: VALID_EMAIL_REGEX

    def full_name
        "#{first_name.capitalize} #{last_name.capitalize}".strip
    end

end
