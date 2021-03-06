Rails.application.routes.draw do
  devise_for :users
  namespace :inscription do
    resources :booking_infos, only: [ :new, :create ]
    get "availabilities", to: "slots#availabilities", as: :availabilities
    resources :booking_contacts, only: [ :new, :create ]
  end

  # Nuits lumières
  get "/nuitslumiere", to: "pages#nuitslumiere", as: :nuitslumiere
  
  # Pages parcours
  get "/parcours", to: "pages#parcours", as: :parcours
  get "/parcours/tarifs", to: "pages#tarifs", as: :tarifs
  get "/parcours/a-vaillant-coeur", to: "pages#a_vaillant_coeur", as: :a_vaillant_coeur
  get "/parcours/la-grande-history", to: "pages#la_grande_history", as: :la_grande_history
  get "/parcours/horaires", to: "pages#horaires", as: :horaires
  get "/reservation", to: "pages#reservation", as: :reservation
  
  # Pages Wine Gaming
  get "/wine-gaming", to: "pages#wine_gaming", as: :wine_gaming
  
  # Pages annexes
  get "/contact", to: "pages#contact", as: :contact
  get "/faq", to: "pages#faq", as: :faq
  get "/conditions-generales-de-ventes", to: "pages#cgu", as: :cgu
  get "/mentions-legales", to: "pages#mentions_legales", as: :mentions_legales
  get "/politique-confidentialite", to: "pages#politique_confidentialite", as: :politique_confidentialite

  # Pages root
  root to: "pages#home"
end
