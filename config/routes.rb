Rails.application.routes.draw do
  root to: "top#index"

  # deviseではshowのルーティングがないので追加
  resources :users, only: [:show]

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}

  resources :posts do
    resources :post_comments, only: [:new, :create, :destroy] do
      resources :post_comment_replies, only: [:new, :create, :destroy]
    end
    resources :likes, only: [:create, :destroy]
    resources :wants, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create]

end
