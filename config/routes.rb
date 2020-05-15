Rails.application.routes.draw do

  root 'events#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :events do
    resources :attendances
    resources :illustrations, only: [:create]
  end


  resources :users do
    resources :avatars, only: [:create]
  end

end
