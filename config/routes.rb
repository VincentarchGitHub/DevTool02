Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :projects do
    resources :posts 
  end

  resources :posts do
    resources :elements
    resources :comments
  end
  
  resources :comments do
    resources :comments
  end 
  get 'history', to: 'comments#history'

  devise_for :users
  
  root 'projects#index'
  get 'about', to: 'pages#about'
  
  

  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
