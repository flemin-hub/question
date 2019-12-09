Rails.application.routes.draw do
 
  
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/result" => "figures#new"
  
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  get "users/:id/edit" => "users#edit"
  
  get "login" => "users#login_form"
  
  post "posts/create" => "posts#create"
  post "posts/:id/yes_create" => "figures#yes_create"
  post "posts/:id/no_create" => "figures#no_create"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/result/destroy" => "figures#destroy"
  
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
