Rails.application.routes.draw do
  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :cities

    resources :laundries, only: [:index, :show] do
      resources :ratings, only: [:create]
      resources :orders, only: [:create]
    end

    resources :categories, only: [:index] do
      resources :items, only: [:index], shallow: true do
        resources :treatments, only: [:index]
      end
    end

    resources :orders, only: [:index]
  end

  namespace :admin do
    resources :laundries
  end
end
