Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })

end
