class User < ApplicationRecord
  #def tests_by_level(level)
  #  Test.joins('JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: { user_id: id }, level: level)
  #end

  def tests_by_level(level)
    tests.where( level: level )
  end

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
end
