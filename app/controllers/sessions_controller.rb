class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:from_url) || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email ans Password please'
      render :new
    end
  end
end
