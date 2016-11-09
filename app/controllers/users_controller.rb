class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @check_user = User.new(username: params[:user][:password_confirmation])
    if @user.save && @check_user.save
      session[:user_id] = @user.id
      flash[:success]   = "User Successfully Created"
      redirect_to '/'
    else
      @user = User.new
      flash[:danger] = @check_user.errors.full_messages
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
