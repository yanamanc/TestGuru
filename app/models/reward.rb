class Reward < ApplicationRecord
  belongs_to :user
  belongs_to :test

  def initialize(test_passage)
  	super({})
  	self.title = set_title(test_passage.test.title)
  	self.url = 'http://pngimg.com/uploads/gold_medal/gold_medal_PNG63.png'
  	self.user_id = test_passage.user_id
  	self.test_id = test_passage.test_id
  	self.save
  end

  private

  def set_title(title)
  	"you passed #{title} test successfully"
  end
end

