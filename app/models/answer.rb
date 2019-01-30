class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :valid_count, on: :create

  scope :correct, -> { where(correct: true) }

  def valid_count
    errors.add(:quesion, "Should be less then 5 answers") if question.answers.count >= 4
  end
end
