Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/create'
  # get 'password_resets/edit'
  # get 'password_resets/update'
  get 'admin' => 'admin#index'
  controller :sessions do
    # get 'login' => :new
    # post 'login' => :create
    # delete 'logout' => :destroy
  end

  # get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  resources :products do
    get :who_bought, on: :member
  end
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end

  get 'user2s/new', to: 'user2s#new', as: 'new_user2'
  post 'user2s/create', to: 'user2s#create'
  get 'user2s/login', to: 'user2s#login', as: 'login'
  post 'user2s/login', to: 'user2s#authenticate'
  get 'user2s/dashboard', to: 'user2s#dashboard', as: 'user2s_dashboard'
  delete 'user2s/logout', to: 'user2s#logout', as: 'user2s_logout'


  get 'password_resets/new', to: 'password_resets#new'
  post 'password_resets/update', to: 'password_resets#update_password'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
