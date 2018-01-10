Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [:update, :index] do
      resources :items, only: [:create, :update, :destroy, :index]
    end

    resources :items, only: [:create, :destroy, :update, :index]
  end

end
