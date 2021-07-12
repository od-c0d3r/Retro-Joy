class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Welcome! Please signin"
      redirect_to root_url
    else
      debugger
      render 'new'
    end
  end

end

private

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
