class Api::V1::TagsController < ApplicationController
  def update
    link = Link.find(params[:id])

    params[:link]['tags'].map do |tag_name|
      link.tags.find_or_create_by(title: tag_name)
    end
  end
end
