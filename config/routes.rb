Rails.application.routes.draw do
  root to: 'pages#index'

  controller :pages do
    get 'payment_confirm' => :payment_confirm
  end

  resources :movies, only: [:new, :create, :edit, :update]

  resources :profile, only: [:index]
  resources :password, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
