Rails.application.routes.draw do
  resources :desireds
  resources :watcheds
  devise_for :users, skip: %i[registrations sessions passwords]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/user_desireds', to: 'desireds#owns'
  get '/user_watcheds', to: 'watcheds#owns'
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
