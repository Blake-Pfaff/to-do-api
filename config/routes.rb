Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [:update] do
      resources :items, only: [:create, :update, :destroy]
    end

    resources :items, only: [:destroy, :update]
  end

end
