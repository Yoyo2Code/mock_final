class Api::V1::LinksController < ApplicationController
  protect_from_forgery with: :null_session

  def update
    render json: Link.update(params[:id], link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url_location, :read)
  end
end
