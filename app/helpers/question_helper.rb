module QuestionHelper
  def question_header(question)
    if question.persisted?
      "Edit question"
    else
      "Create new question"
    end
  end
end
