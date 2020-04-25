Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'home", to: "lead#new'
  # get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get    "leads",          to: "leads#index"

  get    "getintouch",      to: "leads#new",  as: :new_lead
  post   "leads",          to: "leads#create"

  # NB: The `show` route needs to be *after* `new` route.


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end



