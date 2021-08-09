Rails.application.routes.draw do
  
  root 'projects#index'
  get 'about', to: 'pages#about'
  
  devise_for :users

  resources :projects do
    resources :posts do
      resources :elements
    end 
  end 
  
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
