class SessionsController < ApplicationController
  def new
  end

  def destroy
    session.clear
    flash[:success] = 'Successfully logged out!'
    redirect_to login_path
  end

  def create
    user = User.find_by(username: user_params["username"])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as #{current_user.username}"
      redirect_to '/'
    else
      flash[:danger] = "Invalid login details"
      render :new
    end
  end

  private

  def user_params
    params.require(:session).permit(:username, :password)
  end
end
