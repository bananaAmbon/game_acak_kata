class Question
  def initialize level
    @questions = IO.readlines("questions.txt").map {|s| s.chomp}.shuffle
    @level = level
  end

  def current_question
    @current_question = @questions.sample(@level)
    @questions -= @current_question

    random_question = @current_question.map {|q| q.split("").shuffle.join}
    random_question
  end

  def continue? answer
    if answer == "Y" || answer == "y"
      @questions = IO.readlines("questions.txt").map {|s| s.chomp}.shuffle
      true
    else
      false
    end
  end

  def answer_correct? answer
    current_answer = answer.split(" ")
    if current_answer == @current_question
      true
    else
      false
    end
  end
end