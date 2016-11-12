Rails.application.routes.draw do
  constraints subdomain: 'partner' do
    get '/', to: 'partner/orders#index'
    get 'profile', to: 'partner/laundries#edit', as: :edit_laundry_profile

    devise_for :laundries, path: '', skip: [:registrations]
    devise_scope :laundry do
      post '/', to: 'devise/registrations#create', as: :laundry_registration
      get 'sign_up', to: 'devise/registrations#new', as: :new_laundry_registration
      get 'settings', to: 'devise/registrations#edit', as: :edit_laundry_registration
      put  '/', to: 'devise/registrations#update'
    end

    scope module: :partner, as: :partner do
      resource :laundry, only: [:update]
      resources :orders, only: [:index, :show]
    end
  end

  constraints subdomain: 'admin' do
    get '/', to: 'admin/cities#index'

    devise_for :admins, path: '', skip: [:registrations]
    devise_scope :admin do
      post '/', to: 'devise/registrations#create', as: :admin_registration
      get 'settings', to: 'devise/registrations#edit', as: :edit_admin_registration
      put  '/', to: 'devise/registrations#update'
    end

    scope module: :admin, as: :admin do
      resources :categories do
        resources :items, shallow: true
      end

      resources :cities do
        resources :laundries, shallow: true
      end
    end
  end

  resources :payments, only: [:create]

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]

    resources :cities do
      resources :laundries, only: [:index]
    end

    resources :laundries, only: [:show] do
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
end
