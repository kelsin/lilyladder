Lilyladder::Application.routes.draw do
  resource :account
  get '/signin' => 'sessions#new', :as => 'signin'
  match '/signin' => 'sessions#create', :via => :post, :as => 'create_signin'
  get '/signout' => 'sessions#destroy', :as => 'signout'

  resources :users

  resources :seasons do
    resources :replays
    resources :registrations
    resources :rounds do
      resources :matches do
        resources :games
      end
    end
  end

  root :to => 'seasons#index'
end
