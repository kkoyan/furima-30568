Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :items do
    resources :orders, only: [:index, :new, :create, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
