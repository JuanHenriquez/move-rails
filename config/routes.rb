Rails.application.routes.draw do
    devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

    resources :users do

        get "dashboard", on: @collection

        resources :conversations do
            resources :messages
        end

        resources :friends, :except => ['destroy']
        resources :posts, :only => ['create', 'edit', 'update', 'destroy']
        resources :photos, :only => ['create', 'edit', 'update', 'destroy']

        scope module: 'posts' do
            resources :post_likes, :only => ['create']
            resources :post_dislikes, :only => ['create']
            resources :post_comments, :only => ['create', 'update', 'destroy']
        end

        scope module: 'photos' do
            resources :photo_likes, :only => ['create']
            resources :photo_dislikes, :only => ['create']
            resources :photo_comments, :only => ['create', 'update', 'destroy']
        end

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
