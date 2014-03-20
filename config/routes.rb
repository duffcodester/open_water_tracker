Weowe::Application.routes.draw do

  root 'swimmers#index'

  devise_for :users

  resources :users
  resources :swim_records
  resources :swimmers

  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'

  match '/analytics', to: 'static_pages#analytics',    via: 'get'
end
