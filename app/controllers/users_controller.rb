class UsersController < ApplicationController
  skip_before_action :redirect_if_logged_out, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
