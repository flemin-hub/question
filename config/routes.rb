Rails.application.routes.draw do
 
  get 'posts/index' => "posts/index"
  get "posts/new" => "posts/new"
  get "posts/:id" => "posts#show"
  
  post "posts/create" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
