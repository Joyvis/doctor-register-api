Rails.application.routes.draw do
  resources :doctors, only: [:index, :show, :update, :create, :destroy]
  resources :specialities, only: [:index]
end
