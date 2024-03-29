Rails.application.routes.draw do
  constraints subdomain: 'partner' do
    get '/', to: 'partner/orders#index', as: :partner_root
    get 'profile', to: 'partner/laundries#edit', as: :edit_laundry_profile

    devise_for :laundries, path: '', skip: [:registrations]
    devise_scope :laundry do
      post '/', to: 'devise/registrations#create', as: :laundry_registration
      get 'sign_up', to: 'devise/registrations#new', as: :new_laundry_registration
      get 'settings', to: 'devise/registrations#edit', as: :edit_laundry_registration
      put '/', to: 'devise/registrations#update'
    end

    scope module: :partner, as: :partner do
      resource :laundry, only: [:update]
      resources :orders, except: %i[new create destroy]
      resources :ratings, only: [:index]

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
      put '/', to: 'devise/registrations#update'
    end

    scope module: :admin, as: :admin do
      resources :orders, except: %i[new create destroy]
      resources :ratings, only: %i[index update destroy]
      resources :promotions, except: %i[edit update destroy]
      resources :promo_codes, only: %i[index new create]

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
    resource :verification_token, only: %i[create update]
    resource :user, only: %i[show create update]

    resources :cities do
      resources :laundries, only: [:index]
    end
    resources :subscriptions, only: [:create]

    resources :laundries, only: [:show] do
      resources :ratings, only: %i[index create]
      resources :orders, only: [:create]
    end

    resources :categories, only: [:index] do
      resources :items, only: [:index], shallow: true do
        resources :treatments, only: [:index]
      end
    end
    resources :items, only: [:index]

    resources :orders, only: %i[index show] do
      resource :payment_token, only: [:create]
    end
    resources :ratings, only: [:update]
    resources :promo_codes, only: [:show], param: :code
  end

  root 'landing/pages#index'

  scope '(:locale)', locale: /en|ru/ do
    get 'about', to: 'landing/pages#about'
    get 'partner', to: 'landing/partner_applications#new'
    get 'contact', to: 'landing/support_requests#new'

    namespace :landing do
      resources :partner_applications, only: [:create]
      resources :support_requests, only: [:create]
    end
  end
end
