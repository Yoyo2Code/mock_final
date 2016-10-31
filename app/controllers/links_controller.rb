class LinksController < ApplicationController
  def index
    # if logged in
    if session[:user_id]
    else
      redirect_to login_path
    end
  end
end
