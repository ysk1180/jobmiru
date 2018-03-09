Rails.application.routes.draw do
  get 'terms', to: 'terms#index', as: :terms

  resources :contacts, only: [:new, :create]

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}

  resources :posts do
    resources :post_comments, only: [:new, :create, :destroy] do
      resources :post_comment_replies, only: [:new, :create, :destroy]
    end
    resources :likes, only: [:create, :destroy]
    resources :wants, only: [:create, :destroy]
  end

  # deviseではshowのルーティングがなかったので追加
  resources :users, only: [:show]
  # Twitterログインに必要
  get 'users/show'

  root to: "top#index"
end
