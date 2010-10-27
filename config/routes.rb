Inspirempls::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentications#create'  
  devise_for :users, :controllers => { :registrations => 'registrations' }  
  resources :posts
  resources :authentications
  
  get "splash/index"
  get "user/index"
  get "site/submit"
  get "site/about"
  get "site/connect"
  get "site/sign_in"
  

  match 'tag/:tag', :to => 'tag#show'

  root :to => "posts#index"
  # root :to => "splash#index"


end
