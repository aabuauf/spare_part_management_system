Rails.application.routes.draw do
  get 'signin' =>'sessions#new'
  get 'sessions/create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'users/index'
  get 'users/show'
  # get 'equipment/:id'
   get 'factories/index'
   get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'factories#index'

  resources :equipment
  resources :spares
end
