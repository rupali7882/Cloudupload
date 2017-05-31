Rails.application.routes.draw do
  resources :orders 
  get 'home/index'
  get '/dashboard' => 'home#dashboard'
  root 'home#index'
  post "/hook" => "orders#hook"


  # resource :users
 	get '/login' => 'sessions#new'
 	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/payment/:id' => 'orders#payment'


  resources :users, :except =>[:create,:new] do
    member do
      get :confirm_email
      get :edit_password_reset
      patch :password_update
    end
    collection do
      get :password_reset
      post :password_reset_submit
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
