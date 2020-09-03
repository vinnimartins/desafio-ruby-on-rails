Rails.application.routes.draw do

  root 'transactions#home'
  
  
  get 'transactions/create'
  get 'transactions/show'
  
  post 'transactions/create', to: 'transactions#create'
end




