Lilyladder::Application.routes.draw do
  resource :account
  resource :session

  resources :users

  resources :seasons do
    resources :registrations
    resources :rounds do
      resources :matches
    end
  end

  root :to => 'seasons#index'
end
