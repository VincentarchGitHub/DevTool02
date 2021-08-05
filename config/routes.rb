Rails.application.routes.draw do
  
  resources :projects
  devise_for :users
  
  # devise_for :users
  root 'projects#index'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
