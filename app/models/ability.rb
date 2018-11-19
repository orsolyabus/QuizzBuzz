class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    alias_action(:create, :read, :update, :delete, to: :crud)


    can(:crud, Quiz) do |quiz|
      user == quiz.user
    end

    can(:crud, Question) do |question|
      user == question.user
    end
  
    can(:take, Quiz) do |quiz|
      @taken = Result.where(user_id: user.id).where(quiz_id: quiz.id)
      user.persisted? && user != quiz.user && @taken == []
    end

    can(:crud, Result) do |result|
      user == result.user
    end
  end
end
