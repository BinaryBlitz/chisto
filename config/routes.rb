Rails.application.routes.draw do
  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :laundries, only: [:index, :show]

    resources :categories, only: [:index] do
      resources :items, only: [:index]
    end
  end

  namespace :admin do
    resources :laundries
  end
end
