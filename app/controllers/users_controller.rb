class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if passwords_match? && @user.save
      session[:user_id] = @user.id
      flash[:success]   = "User Successfully Created"
      redirect_to '/'
    else
      no_error_messages = @user.errors.full_messages.empty?
      message = "Passwords do not match" if no_error_messages
      message = @user.errors.full_messages.join(", ") if !no_error_messages
      flash[:danger] = message
      @user = User.new
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_check_params
    params.require(:user).permit(:username, :password_confirmation)
  end

  def passwords_match?
    user_params["password"] == user_check_params["password_confirmation"]
  end
end
