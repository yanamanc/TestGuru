require 'digest/sha1'

class User < ApplicationRecord

  CORRECT_EMAIL_FORMAT = /@/
  
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authors_tests, class_name: "Test"

  validates :email, presence: true
  validates :email, format: CORRECT_EMAIL_FORMAT, uniqueness: true

  has_secure_password

  def by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
