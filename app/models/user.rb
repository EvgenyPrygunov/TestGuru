class User < ApplicationRecord

  def tests_by_level(level)
    tests.where( level: level )
  end

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
end
