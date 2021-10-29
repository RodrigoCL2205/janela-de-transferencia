Rails.application.routes.draw do
  devise_for :users
  resources :players, except: :destroy do
    resources :deals, except: :destroy
  end
  get "/cart", to: "deals#cart"
  patch "/sale", to: "deals#sale", as: "sale"
  root to: 'pages#home'
  resources :deals, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
