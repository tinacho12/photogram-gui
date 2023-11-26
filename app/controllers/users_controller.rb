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
    the_user = User.where({ :username => username }).first

    the_user.username = params.fetch("updated_username")
    the_user.save 

    next_url = "/users/" + the_user.username.to_s
    redirect_to(next_url)
  end

end
