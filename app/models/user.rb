class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authors_tests, class_name: "Test"

  def tests_by_level(level)
    tests.where(level: level)
  end
end
