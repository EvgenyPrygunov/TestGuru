class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end

    # self.current_question = next_question
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
    questions_sum - next_questions.size
  end

  def completed?
    current_question.nil?
  end

  private

  def before_save_set_next_question
    if self.current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    next_questions.first
  end

end
