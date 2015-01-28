Comsa::Application.routes.draw do

  root 'application#private'

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
  match '/import', to: 'swimmers#import', via: 'get'

end
