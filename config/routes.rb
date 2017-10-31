Rails.application.routes.draw do
  namespace :api do
    resources :appointments, only: [:create, :show, :destroy]
  end
end
