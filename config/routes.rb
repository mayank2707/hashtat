Myapp::Application.routes.draw do

  post '/change_to_artist' => 'users#change_to_artist'

  authenticated :user do
    root :to => 'tattoos#index'
  end
  root :to => "home#index"
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  match 'preview' => 'tattoos#preview'
  get 'search' => 'search#search'
  match 'about' => 'home#about'
  match 'quickpreview' => 'home#quickpreview'
  resources :tattoos do
    resources :comments
    member do 
      post :vote_up
      post :vote_down
    end
  end

 
  resources :artists do
    resources :tattoos
    resources :comments
  end
  resources :artist_steps
  # post '/artists/:artist_id/comments' => 'comments#create', as: 'create_comment'

end