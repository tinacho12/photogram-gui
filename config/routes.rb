Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })

  get("/insert_user", { :controller => "users", :action => "create" })

  get("/users/:username", { :controller => "users", :action => "show" })

  get("/update_user/:modify_username", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })

  get("/insert_photo", { :controller => "photos", :action => "create" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

end
