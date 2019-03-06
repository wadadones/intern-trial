Rails.application.routes.draw do
  resources :articles 
  resources :comments, :except => [:new, :edit]
  get "/comments/:article/new", to: "comments#new"
  get "/comments/:article/:id/edit", to:"comments#edit"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
