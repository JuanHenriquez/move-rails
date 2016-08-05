Rails.application.routes.draw do
  resources :users
  root 'users#login'
  post '/users/auth_local', to: 'users#auth_local'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
