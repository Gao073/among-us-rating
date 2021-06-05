Rails.application.routes.draw do
  resources :matches
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "top#index"
  get "landing" => "top#show"
end
