Rails.application.routes.draw do
    devise_for :users, controllers: { registrations: 'users/registrations' }

    resources :users do

        get "dashboard", on: @collection

        resources :conversations do
            resources :messages
        end
    end

    devise_scope :user do
        root :to => 'devise/sessions#new'
    end



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
