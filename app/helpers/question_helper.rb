module QuestionHelper
  def question_header(question)
    if question.persisted?
      "Edit question from #{question.test.title} test"
    else
      "Create new question to #{question.test.title} test"
    end
  end
end
