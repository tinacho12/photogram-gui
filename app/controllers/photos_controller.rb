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

  def destroy
    the_id = params.fetch("id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    render({ :template => "photo_templates/destroy" })
  end

end
