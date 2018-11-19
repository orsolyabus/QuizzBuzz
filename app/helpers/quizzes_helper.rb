module QuizzesHelper

  def evaluate_quiz(solution, tips)
    score = solution.map.with_index{|val, index| val === tips[index] }
  end

  def add_card_type_class(id)
    if !current_user then return "all" end
    quiz_taken_ids = current_user.quiz_taken.ids
    quiz_created_ids = current_user.quizzes.ids
    if quiz_taken_ids.include?(id) then return "taken" end
    if quiz_created_ids.include?(id) then return "created" end
    return "all"
  end

end

