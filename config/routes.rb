Rails.application.routes.draw do
  resources :doctors, only: [:index, :show, :update, :create, :delete]
  resources :specialities, only: [:index]
end
