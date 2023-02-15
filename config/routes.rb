Rails.application.routes.draw do
  resources :gossip
  resources :user
  resources :city
  #get 'static_pages/contact'
  #get 'static_pages/team'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home'
end
