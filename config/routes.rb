Rails.application.routes.draw do
  devise_for :users
   root to:'pages#home'
   get 'a-propos', to: 'pages#about'
   resources :contacts, only: :create
   get 'nous-contacter', to: 'contacts#new', as:'new_contact'
end
