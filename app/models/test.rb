class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  scope :by_level, ->(level) { where(level:level).order(level: :asc) }
  scope :simple, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.titles_by_category(category)
    joins( :category ).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end

end
