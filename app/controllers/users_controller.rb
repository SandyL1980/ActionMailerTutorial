class UsersController < ApplicationController
  def welcome
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Welcome.welcome_email(@user).deliver
      redirect_to root_path, notice: 'Account created.  Email sent.'
    else
      redirect_to root_path, notice: 'Something bad happened, try again.'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end