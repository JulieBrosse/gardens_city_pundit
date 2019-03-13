Rails.application.routes.draw do
  devise_for :users
  delete 'gardens/:id', to: "gardens#destroy", as: :delete_garden
  resources :gardens, except: [:delete]
  get "my_gardens", to: "gardens#my_gardens", as: :my_gardens
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
