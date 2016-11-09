class LinksController < ApplicationController
  def index
    if session[:user_id]
      @link = Link.new
      @links = current_user.links
      @tags = Tag.all
    else
      redirect_to login_path
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash[:danger] = "Invalid Url"
      render :new
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      flash[:success] = 'Your Link has been saved!'
      redirect_to links_path
    else
      flash[:danger] = @link.errors.full_messages
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url_location)
  end
end
