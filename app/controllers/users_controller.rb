class UsersController < ApplicationController
  include SessionsHelper
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
