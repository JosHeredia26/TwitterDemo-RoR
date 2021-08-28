Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :comments
  resources :tweets do
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
