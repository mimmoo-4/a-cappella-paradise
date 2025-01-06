Rails.application.routes.draw do
  get 'members/show'
  get 'members/edit'
  root to: "homes#top"
  devise_for :members
  resources :members
  resources :posts
  resources :genres
  #favicon.icoへのリクエストを無視
  get '/favicon.ico', to: ->(env) { [404, {}, []] }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
