Rails.application.routes.draw do
   root to:'pages#home'
   devise_for :users, controllers: { registrations: 'users/registrations' }
   resources :users do
     resource :profile
    end
   get 'a-propos', to: 'pages#about'
   resources :contacts, only: :create
   get 'nous-contacter', to: 'contacts#new', as:'new_contact'
end
