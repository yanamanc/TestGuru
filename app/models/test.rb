class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  belongs_to :author, class_name: "User"

  def self.by_category(category_name)
    joins(:category).where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
