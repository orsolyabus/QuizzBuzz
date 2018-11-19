class UserMailer < ApplicationMailer
  def notify_user_created(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome To QuizzBuzz, #{@user&.full_name}"
    )
  end

  def notify_quiz_created(quiz)
    @quiz = quiz
    @user = @quiz.user

    mail(
      to: @user.email,
      subject: "Your Quiz Is Now Created - #{@quiz.title}"
    )
  end
end
