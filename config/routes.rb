Rails.application.routes.draw do
 
  get 'posts/index' => "posts/index"
  get "posts/new" => "posts/new"
  get "posts/:id" => "posts#show"
  get "posts/:id/result" => "figures#new"
  
  post "posts/create" => "posts#create"
  post "posts/:id/yes_create" => "figures#yes_create"
  post "posts/:id/no_create" => "figures#no_create"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
