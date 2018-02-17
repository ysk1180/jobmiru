Rails.application.routes.draw do

  resources :contacts

  get 'users/show'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}

  resources :posts do
    resources :comment_to_posts do
      resources :reply_to_comments
    end
    resources :likes, only: [:create, :destroy]
    resources :want_to_works, only: [:create, :destroy]
  end

  # deviseではshowのルーティングがなかったので追加
  resources :users, only: [:show]

  # トップページへのルーティング
  root to: "top#index"
end
