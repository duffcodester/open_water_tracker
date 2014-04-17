Comsa::Application.routes.draw do

  root 'swimmers#index'

  devise_for :users

  resources :users
  resources :swim_records
  resources :swimmers

  match '/analytics',
        to: 'static_pages#analytics',
        via: 'get'
  match '/analytics',
        to: 'static_pages#analytics',
        via: 'post'

  # match '/out_of_state_swimmers', to: 'swimmers#out_of_state_swimmers', via: 'get'
  match '/records', to: 'swim_records#records',    via: 'get'
  match '/import', to: 'swimmers#import', via: 'get'
end
