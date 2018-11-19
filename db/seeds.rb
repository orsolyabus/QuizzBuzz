Result.delete_all
Question.delete_all
Quiz.delete_all
User.delete_all

PASSWORD = "superadmin"
NUM_OF_CREATES = 100

super_user = User.create(
  nickname: "Test Admin",
  first_name: "Test",
  last_name: "User",
  email: "test@user.com",
  password: PASSWORD,
  admin: true
)

10.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  u = User.create(
    nickname: Faker::FunnyName.two_word_name,
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all

NUM_OF_CREATES.times do
  quiz = Quiz.create(
    title: Faker::ChuckNorris.fact,
    description: Faker::Hacker.say_something_smart,
    user: users.sample
  )

  quiz.quiz_taker = users.shuffle.slice(0, rand(users.count))

  if quiz.valid?
    rand(0..11).times do
      quiz.questions << Question.new(
        question: Faker::Friends.quote,
        option0: Faker::Friends.character,
        option1: Faker::Friends.character,
        option2: Faker::Friends.character,
        option3: Faker::Friends.character,
        correct_answer: rand(0..4)
      )
    end
  end
end

quizzes = Quiz.all
questions = Question.all
results = Result.all

results.each do |r|
  r.score = rand(0..11)
  r.save
end


puts "Created #{quizzes.count} quizzes, #{questions.count} questions, #{results.count} results and #{users.count} users!"
puts "Login with #{super_user.email} and password of `#{PASSWORD}`!"
