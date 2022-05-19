Rails.application.routes.draw do
  devise_for :users
  namespace :inscription do
    resources :booking_infos, only: [ :new, :create ]
    get "availabilities", to: "slots#availabilities", as: :availabilities
    resources :booking_contacts, only: [ :new, :create ]
  end

  #Pages
  get "/parcours", to: "pages#parcours", as: :parcours
  get "/parcours/concept", to: "pages#concept", as: :concept

  root to: "pages#home"
end
