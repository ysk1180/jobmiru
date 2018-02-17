Rails.application.routes.draw do

  resources :contacts

  get 'users/show'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}

  resources :posts do
    resources :post_comments do
      resources :post_comment_replies
    end
    resources :likes, only: [:create, :destroy]
    resources :wants, only: [:create, :destroy]
  end

  # deviseではshowのルーティングがなかったので追加
  resources :users, only: [:show]

  # トップページへのルーティング
  root to: "top#index"
end
