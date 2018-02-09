Rails.application.routes.draw do


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }
  resources :users
  root 'simple_pages#index' # root 'simple_pages#index'

  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/login'
  get 'simple_pages/landing_page'

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



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
