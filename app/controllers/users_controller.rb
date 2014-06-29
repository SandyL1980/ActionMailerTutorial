class UsersController < ApplicationController
  def welcome
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Account created.'
    else
      flash.now[:alert] = 'Something bad happened, try again.'
      render 'welcome'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end