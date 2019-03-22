Rails.application.routes.draw do
  devise_for :users
  delete 'delete_garden', to: "gardens#destroy", as: :delete_garden
  get 'new_garden', to: "gardens#new", as: :new_garden
  resources :gardens, except: [:destroy, :new] do
    resources :bookings, only: [:new, :create, :show]
  end
  delete 'delete_booking', to: 'bookings#destroy', as: :delete_booking
  get "bookings", to: "bookings#my_bookings", as: :my_bookings
  get "my_gardens", to: "gardens#my_gardens", as: :my_gardens
  get "my_account", to: "pages#my_account", as: :my_account
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
