Rails.application.routes.draw do
  namespace :api do
    resources :appointments, only: [:create, :destroy]
    get 'appointments/:date', to: 'appointments#find_by_date', as: 'appointment_date', param: :date
  end
end
