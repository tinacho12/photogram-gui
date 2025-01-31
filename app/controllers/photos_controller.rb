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

    redirect_to("/photos")
    #render({ :template => "photo_templates/destroy" })
  end


  def create

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    
    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
    #render({ :template => "photo_templates/create" })
  end

  def update

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption= input_caption

    the_photo.save
    
    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
    #redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/update"})
  end

=begin
  def comment
    render({ :template => "photo_templates/comment" })
  end
=end

  def comment

    input_photo_id = params.fetch("photo_id")
    input_author_id = params.fetch("author_id")
    input_comment = params.fetch("comment")
    
    new_comment = Comment.new
    new_comment.photo_id = input_photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_comment

    new_comment.save
    
    next_url = "/photos/" + input_photo_id
    redirect_to(next_url)
    #redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/update"})
  end

end
