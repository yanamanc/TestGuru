class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  scope :by_level, -> (difficulty_level) { where(level: difficulty_level) }
  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }
  scope :by_category, -> (category_name) { joins(:category).where(categories: { title: category_name }).order(title: :desc) }
  
  def self.sort_by_categoryl(category_name)
    by_category(category_name).pluck(:title)
  end
end
