Rails.application.routes.draw do
    devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

    resources :users do

        get "dashboard", on: @collection

        resources :conversations do
            resources :messages
        end

        resources :friends, :except => ['destroy']

        delete "friends", to: "friends#destroy", as: "friends_delete"
        post "friends_request", to: "friends#send_request"
        get "friends_pending", to: "friends#pending"
        get "friends_search", to: "friends#search"
    end

    devise_scope :user do
        root :to => 'devise/sessions#new'
    end



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
