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
  get "/parcours/tarifs", to: "pages#tarifs", as: :tarifs
  get "/conditions-generales-de-ventes", to: "pages#cgu", as: :cgu
  get "/mentions-legales", to: "pages#mentions_legales", as: :mentions_legales
  get "/politique-confidentialite", to: "pages#politique_confidentialite", as: :politique_confidentialite

  root to: "pages#home"
end
