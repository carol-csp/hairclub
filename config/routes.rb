Rails.application.routes.draw do
  resources :categories
  get 'subscribers/index'

  resources :orders do resources:orderitems
end
  
  devise_for :users do 
    resources:orders 
  end
  
  get '/checkout' => 'cart#createOrder'
  
  post '/search' => 'items#search'
  
  get '/payment' => 'orders#pay'
  get '/shipped/:id' => 'orders#shipped'
  get 'cart/index'

  resources :items
  root 'static_pages#home'


  get '/help' => 'static_pages#help'
  
  get '/contact' => 'static_pages#contact'
  
  get '/aboutSend/:id' => 'static_pages#aboutSend'

  get '/about' => 'static_pages#about'

get '/cart' => 'cart#index'

get '/cart/clear' => 'cart#clear'
get '/cart/:id' => 'cart#add'
get '/cart/remove/:id' => 'cart#remove'

get 'category/:title', to: 'static_pages#category'

 
end
