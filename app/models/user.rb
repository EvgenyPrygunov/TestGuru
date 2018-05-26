require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  EMAIL_FORMAT = /\A[^@]+@(\w+\.+[a-zA-Z]{1,})+\z/i

  validates :email, format: EMAIL_FORMAT, uniqueness: { scope: :user_id }

  has_secure_password

  def tests_by_level(level)
    tests.where( level: level )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
