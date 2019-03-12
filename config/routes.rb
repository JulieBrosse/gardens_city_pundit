Rails.application.routes.draw do
  devise_for :users
  delete 'gardens/:id', to: "gardens#destroy", as: :delete_garden
  resources :gardens, except: [:delete]
  root to: 'gardens#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
