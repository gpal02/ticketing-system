Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
    
    scope '/admin' do
      
      resources :users do
        member do
          get :change_status
          patch :change_status
        end
      end
    end
      root "users#index"
  resources :buses 
      
  resources :tickets do
    resources :passenger_informations
  end
 
end
