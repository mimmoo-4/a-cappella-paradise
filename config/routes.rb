Rails.application.routes.draw do
    devise_for :admin, skip:[:registrations, :password],controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :posts do
      resources :post_comments, only:[:create, :destroy]
    end
    resources :members
    resources :genres
  end

  scope module: :public do
    root to: "homes#top"
    devise_for :members
    resources :members
    resources :posts do
      resources :post_comments, only:[:create, :destroy]
    end
    resources :groups do
      resource :group_members, only: [:create, :destroy]
    end
    get "search" => "searches#search"
  end

end
