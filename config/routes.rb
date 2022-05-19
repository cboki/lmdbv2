Rails.application.routes.draw do
  devise_for :users
  namespace :inscription do
    resources :booking_infos, only: [ :new, :create ]
    get "availabilities", to: "slots#availabilities", as: :availabilities
    resources :booking_contacts, only: [ :new, :create ]
  end
  root to: "pages#home"
end
