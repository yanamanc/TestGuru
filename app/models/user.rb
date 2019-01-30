class User < ApplicationRecord
  def tests_with_that_level(level)
    self.test.where(level: level)
  end
end
