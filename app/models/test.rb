class Test < ApplicationRecord
  def self.titles_by_category(category)
    joins( :category ).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :simple, -> { where(level: 0..1).order(level: :asc) }
  scope :medium, -> { where(level: 2..4).order(level: :asc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(level: :asc) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numeralicity: { only_integer: true, greater_than_or_equal_to: 0 }
end
