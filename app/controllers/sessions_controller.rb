class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :require_login, only: [:new, :create]

def new
  # @user = User.all
end

def create
  user = User.find_by(email: params[:session][:email].downcase)
  # if user && user.authenticate(params[:session][:email], params[:session][:password])
  if User.authenticate(params[:session][:email], params[:session][:password])
    log_in user
    redirect_to user_path(user)
  else
    flash.now[:danger] = "Invalid email or password"
    render :new
  end
end

def destroy
  log_out
  redirect_to users_path
  flash.now[:success] = "You have successfully logged out"
end

end
