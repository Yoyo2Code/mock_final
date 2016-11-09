class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @check_user = User.new(user_check_params)
    if passwords_match? && @user.save
      session[:user_id] = @user.id
      flash[:success]   = "User Successfully Created"
      redirect_to '/'
    else
      flash[:danger] = @user.errors.full_messages.join(", ")
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
    params[:password] == params[:password_confirmation]
  end
end
