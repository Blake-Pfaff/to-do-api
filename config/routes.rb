Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: %i[update index] do
      resources :items, only: %i[create update destroy index]
    end

    resources :items, only: %i[create destroy update index]
  end
end
