class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    if question.answers.length > 4 && question.answers.length < 0
      errors.add(:question, "Min 1 answer, max 4 answers.")
    end
  end
end
