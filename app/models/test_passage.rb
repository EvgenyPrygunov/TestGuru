class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :before_save_set_next_question

  def accept!(answers_ids)
    if correct_answer?
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def correct_answers_percent
    self.correct_questions * 100 / questions_sum
  end

  def passed?
    correct_answers_percent >= 85
  end

  def questions_sum
    test.questions.size
  end

  def question_number
    questions_sum - next_question.size
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

end
