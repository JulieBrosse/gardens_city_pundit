Rails.application.routes.draw do
devise_for :users, controllers: {registrations: 'users/registrations'}
devise_scope :user do
  get "edit_place_and_radius", to: "users/registrations#edit_place_and_radius", as: :edit_place_and_radius
  patch "update_place_and_radius", to: "users/registrations#update_place_and_radius", as: :update_place_and_radius
end

  resources :gardens, except: [:destroy, :new] do
    resources :bookings, only: [:new, :create, :show]
  end
  delete 'delete_garden', to: "gardens#destroy", as: :delete_garden
  get 'new_garden', to: "gardens#new", as: :new_garden
  get "my_gardens", to: "gardens#my_gardens", as: :my_gardens

  delete 'delete_booking', to: 'bookings#destroy', as: :delete_booking
  get "bookings", to: "bookings#my_bookings", as: :my_bookings
  get "show_from_booking_action", to: "bookings#show_from_booking_action", as: :show_from_booking_action # >>> put in nested resources, such as :show
  get "my_account", to: "pages#my_account", as: :my_account

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

