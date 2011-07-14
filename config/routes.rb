SampleApp::Application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :blogs,         :only => [:destroy]
  resources :shows
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :microposts,    :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :tracks,        :only => [:index]
  resources :pictures,		:only => [:index]
  
  root :to => "geronimo#index"

  match "/myspace" => redirect("http://www.myspace.com/thegeronimoband")
  match "/facebook" => redirect("http://www.facebook.com/thegeronimoband")
  
  match '/tracks/:id/frontpage', :to => 'tracks#frontpage', :as => 'tracks_frontpage'
  match '/tracks/:id/makepublic', :to => 'tracks#makepublic', :as => 'tracks_public'
  match '/tracks/:id/makeprivate', :to => 'tracks#makeprivate', :as => 'tracks_private'  
  match '/everything', :to => 'geronimo#everything'
  match '/blogs',      :to => 'geronimo#blogs'
  match '/all_shows',  :to => 'geronimo#shows'
  match '/aug17',   :to => 'geronimo#aug17'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/home',    :to => 'pages#home'
end
