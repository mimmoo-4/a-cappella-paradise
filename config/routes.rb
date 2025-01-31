Rails.application.routes.draw do
    devise_for :admin, skip:[:registrations, :password],controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :posts do
      resources :post_comments, only:[:destroy]
    end
    resources :members
    resources :genres
    resources :groups, only:[:destroy, :index]
    resources :post_comments, only:[:destroy, :index]
  end

  scope module: :public do
    root to: "homes#top"
    devise_for :members
    resources :members
    resources :posts do
      resources :post_comments, only:[:create, :destroy]
    end
    resources :groups do
      resources :permits, only: [:create, :destroy]
      resource :group_members, only: [:create, :destroy]
      resources :group_chats, only:[:create, :destroy, :show]
    end
    get "groups/:id/permits" => "groups#permits", as: :permits
    get "search" => "searches#search"
  end

end
