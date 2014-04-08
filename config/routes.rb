Weowe::Application.routes.draw do

  resources :analytics

  root 'swimmers#index'

  devise_for :users

  resources :users
  resources :swim_records
  resources :swimmers

  match '/swimmer_analytics', to: 'analytics#show',    via: 'get'
  match '/records', to: 'swim_records#records',    via: 'get'
  match '/import', to: 'swimmers#import', via: 'get'
end
