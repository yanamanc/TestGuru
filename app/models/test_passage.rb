class TestPassage < ApplicationRecord
  SUCCESS_POINT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional:true

  before_validation :before_validation_set_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def success?
    points_persents >= SUCCESS_POINT
  end

  def points_persents
    correct_questions.to_f / test.questions.count * 100
  end

  def completed?
    current_question.nil?
  end

  def question_index
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  private

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_question
    self.current_question = test.questions.first if test.present?
  end
end
