class Feedback < ApplicationRecord
  validates :title, :body, presence: true
end
