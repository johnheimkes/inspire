Inspirempls::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentications#create'  
  match '/auth/sign_out' => 'authentications#destroy'
  devise_for :users, :controllers => { :registrations => 'registrations' }  
  resources :posts
  resources :authentications
  resources :user
  
  get "splash/index"
  get "/submit", :to => 'site#submit'
  get "/about", :to => 'site#about'
  get "/connect", :to => 'site#connect'
  get "/event", :to => 'site#event'

  match 'tag/:tag', :to => 'tag#show'

  root :to => "posts#index"
  # root :to => "splash#index"

end
