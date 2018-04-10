class Test < ApplicationRecord
  def self.titles_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
end
