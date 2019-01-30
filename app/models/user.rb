class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :authors
  has_many :tests, through: :authors

  def tests_by_level(level)
    tests.where(level: level)
  end
end
