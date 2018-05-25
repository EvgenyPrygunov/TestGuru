class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    if question.answers.count >= 4
      errors.add(:base, "Min 1 answer, max 4 answers.")
    end
  end
end
