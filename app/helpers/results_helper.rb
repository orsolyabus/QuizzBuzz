module ResultsHelper

  def calculate_score(answers)
    quiz_id = answers[:quiz_id]
    submitted_answers = clear_data(answers)
    answer_keys = get_answer_keys(quiz_id)
    correct_answers = compare_answers(answer_keys, submitted_answers)
    score = get_score(correct_answers) # we can add the difficoulty here
  end

  def clear_data(answers)
    to_reject = [ "authenticity_token", "controller", "action", "quiz_id" ]
    answers.delete_if { |k| to_reject.include?(k) }
  end

  def get_answer_keys(id)
    Quiz.find(id).questions.each_with_object({}) { |q, hash| hash.store(q.id, q.correct_answer) }
  end

  def compare_answers(correct, guess)
    guess.reject { |k, v| v.to_i != correct[k.to_i] }
  end

  def get_score(correct_answers)
    correct_answers.keys.length # times difficoulty
  end

end
