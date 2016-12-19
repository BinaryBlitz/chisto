Rails.application.routes.draw do
  constraints subdomain: 'partner' do
    get '/', to: 'partner/orders#index', as: :partner_root
    get 'profile', to: 'partner/laundries#edit', as: :edit_laundry_profile

    devise_for :laundries, path: '', skip: [:registrations]
    devise_scope :laundry do
      post '/', to: 'devise/registrations#create', as: :laundry_registration
      get 'sign_up', to: 'devise/registrations#new', as: :new_laundry_registration
      get 'settings', to: 'devise/registrations#edit', as: :edit_laundry_registration
      put  '/', to: 'devise/registrations#update'
    end

    scope module: :partner, as: :partner do
      resource :schedule

      resource :laundry, only: [:update]
      resources :orders, except: [:new, :create, :destroy]

      resources :categories, only: [:index] do
        resources :treatments, only: [:index]
      end

      resources :items, only: [] do
        resource :laundry_item, except: [:show]
      end

      resources :treatments, only: [] do
        resource :laundry_treatment, except: [:show]
      end
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
      resources :orders, except: [:new, :create, :destroy]

      resources :cities do
        resources :laundries, shallow: true
      end

      resources :categories do
        resources :items, shallow: true do
          resources :treatments, shallow: true
        end
      end
    end
  end

  resources :payments, only: [:create]

  namespace :api do
    resource :verification_token, only: [:create, :update]
    resource :user, only: [:show, :create, :update]

    resources :cities do
      resources :laundries, only: [:index]
    end

    resources :laundries, only: [:show] do
      resources :ratings, only: [:index, :create]
      resources :orders, only: [:create]
    end

    resources :categories, only: [:index] do
      resources :items, only: [:index], shallow: true do
        resources :treatments, only: [:index]
      end
    end

    resources :orders, only: [:index, :show]
  end

  root 'landing#index'

  get 'about', to: 'landing#about'

  get 'partner', to: 'landing/partner_applications#new'
  namespace :landing do
    resources :partner_applications, only: [:create]
  end

  get 'contact', to: 'landing#contact'
end
