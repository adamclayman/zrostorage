Rails.application.routes.draw do


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }
  resources :users
  root 'simple_pages#index' # root 'simple_pages#index'

  get '/index', to: 'simple_pages#index'
  get '/about', to: 'simple_pages#about'
  get '/contact', to: 'simple_pages#contact'
  get '/login', to: 'simple_pages#login'
  get '/landing_page', to: 'simple_pages#landing_page'

  post 'simple_pages/thank_you'
  post 'payments/create'

  authenticated :admin do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :products do
    resources :comments
  end

  resources :users, except: [:index]

  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
