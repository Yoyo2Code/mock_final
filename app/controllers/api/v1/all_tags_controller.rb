class Api::V1::AllTagsController < ApplicationController
  def delete
    Tag.find(params[:id]).link_tags.delete_all
    Tag.delete(params[:id])
  end
end
