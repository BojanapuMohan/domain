Rails.application.routes.draw do
  
  
  resources :newdomains do
  	resources :domainranks 
  end
  #get "newdomains/dashboard"
  devise_for :users
 # get 'welcome/index'
 get 'welcome/profile'
 get 'welcome/allusers'
 root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
