class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username })
    
    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" })
    end
  end

  def create
    input_username = params.fetch("username")
    
    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save

    redirect_to("/users/" + a_new_user.username.to_s)
  end

  def update
    user_id = params.fetch("modify_username")
    my_input_username = params.fetch("updated_username")
    the_user = User.where(id: user_id).first
    the_user.username = my_input_username
    the_user.save
    redirect_to("/users/" + my_input_username)
  end

end
