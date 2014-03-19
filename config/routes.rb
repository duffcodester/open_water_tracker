Weowe::Application.routes.draw do
  resources :swim_records

  resources :swimmers

  devise_scope :user do
    root 'devise/sessions#new'
  end

  devise_for :users

  resources :users

  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'

  match '/analytics', to: 'static_pages#analytics',    via: 'get'
end
