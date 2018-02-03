Rails.application.routes.draw do
  resources :reply_to_comments
  get 'introduction/index'

  resources :contacts
  resources :comment_to_posts
  # do
  #   member do
  #     post 'reply'
  #   end
  # end


  get 'users/show'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # deviseではshowのルーティングがなかったので追加
  resources :users, only: [:show]

  # トップページへのルーティング
  root to: "top#index"

  # いいね機能実装に伴うルーティング
  resources :like_to_posts, only: [:create, :destroy]

  # 働きたい機能実装に伴うルーティング
  resources :want_to_works, only: [:create, :destroy]

end
