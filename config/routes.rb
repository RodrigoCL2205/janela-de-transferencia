Rails.application.routes.draw do
  devise_for :users
  resources :deals, only: [:new, :create]
  root to: 'pages#home'
  resources :players, except: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
