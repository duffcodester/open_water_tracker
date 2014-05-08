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

  match '/out_of_state', to: 'swimmers#out_of_state', via: 'get'
  match '/records', to: 'swim_records#records',    via: 'get'
  match '/import', to: 'swimmers#import', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/tos', to: 'static_pages#tos', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/admin', to: 'static_pages#admin', via: 'get'
end
