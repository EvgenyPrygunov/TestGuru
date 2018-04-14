class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :answers, numericality: { greater_than: 0, less_than: 5 }
end
