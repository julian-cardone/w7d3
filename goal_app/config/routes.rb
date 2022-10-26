Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :goals, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :goals, except: [:index]
end
