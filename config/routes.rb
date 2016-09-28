Rails.application.routes.draw do
  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :laundries, only: [:index, :show]
  end

  namespace :admin do
    resources :laundries
  end
end
