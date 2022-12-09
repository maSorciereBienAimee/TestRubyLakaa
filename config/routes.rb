Rails.application.routes.draw do
  resources :collects
  resources :indicators

  root to: "home#index"
  post "indicators", controller: :indicators, action: :create
  post "collect", controller: :collects, action: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
