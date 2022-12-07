Rails.application.routes.draw do
  
  devise_for :users
    
    scope '/admin' do
      
      resources :users do
        member do
          get :change_status
          patch :change_status
        end
      end

      resources :buses 
      
      resources :tickets do
        resources :passenger_informations
      end
      
      resources :seats

    end
  # get 'tickets/index'
  # get 'buses/index'
  # get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  # resources :users do
  #   collection do
  #     get :new_login
  #     post :login
  #     delete :signout
  #     patch :change_status
  #   end
  # end
  
  

end
