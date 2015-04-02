Comsa::Application.routes.draw do
  root 'swimmers#check_in'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  scope 'api' do
    resources :swimmers
    resources :swim_records
    resources :users
    get '/analytics' => 'api#analytics'
    get '/records' => 'api#records'
    match 'out_of_state', to: 'api#out_of_state', via: [:post, :get]
  end

  match '/instructions', to: 'public#instructions', via: 'get'
  match '/faq', to: 'public#faq', via: 'get'
  match '/privacy', to: 'public#privacy', via: 'get'
  match '/tos', to: 'public#tos', via: 'get'

  match '/check_in', to: 'swimmers#check_in', via: 'get'
  match '/check_out', to: 'swimmers#check_out', via: 'get'
  match '/out_of_state', to: 'swimmers#out_of_state', via: 'get'
  match '/analytics', to: 'swimmers#analytics', via: 'get'
  match '/import', to: 'swimmers#import', via: 'get'

  match '/monitors', to: 'users#monitors', via: 'get'
  match '/my_profile', to: 'users#my_profile', via: 'get'
  match '/monitors/add', to: 'users#add', via: 'get'
  match '/my_profile/edit', to: 'users#edit', via: 'get'

end
