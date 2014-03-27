Weowe::Application.routes.draw do

  resources :analytics

  root 'swimmers#index'

  devise_for :users

  resources :users
  resources :swim_records
  resources :swimmers

  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'

  match '/swimmer_analytics', to: 'analytics#show',    via: 'get'
end
