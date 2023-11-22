class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_order => :desc })
    
    render({ :template => "photo_templates/index" })
  end

  def show

    url_id = params.fetch("id")
    matching_photos = Photo.where({ :id => url_id })
    
    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show" })
  end

end
