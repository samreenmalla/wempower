Rails.application.routes.draw do
  devise_for :users, :controllers => {:invitations => 'users/invitations' }
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'sessions/new'
  get 'static_pages/donation'
  get 'static_pages/search'
  get 'tags/:tag', to: 'ideas#index', as: :tag
  root 'posts#index'

 resources :chat_rooms, only: [:new, :create, :show, :index, :update] 
 mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end
  resources :ideas do
    resources :comments
  end
  resources :donations
  resources :users, only: :show

end





