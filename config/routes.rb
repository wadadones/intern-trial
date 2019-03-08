Rails.application.routes.draw do
  resources :articles 
  resources :comments, :except => [:new, :edit]
  get "/comments/:article/new", to: "comments#new", as: "new_comment"
  get "/comments/:article/:id/edit", to:"comments#edit", as: "edit_comment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
