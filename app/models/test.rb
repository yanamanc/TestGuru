class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  def self.tests_with_that_categoryl(category)
    test.where(category: category).order("test.title DESC").pluck(:title)
  end
end
