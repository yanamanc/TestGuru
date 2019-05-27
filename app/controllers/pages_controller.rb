class PagesController < ApplicationController
  def statistic
    @tests = Test.all
  end
end
