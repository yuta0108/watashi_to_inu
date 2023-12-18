Rails.application.routes.draw do

  root to: 'public/homes#top'

  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  namespace :admin do
    get "search" => "searches#search"
    resources :orders, only: [:index, :update, :show]
    resources :customers, only: [:index, :edit]
    resources :genres, only: [:index, :create,  :update, :edit]
    resources :items, only: [:new, :show, :index, :edit, :create, :update]
    get '/' => 'customers#index'
  end

  namespace :public do
    get "search" => "searches#search"
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
      get 'orders/thanks' => 'orders#thanks'
      get 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:show, :index]
    resources :items, only: [:show, :index,]
    resources :cart_items, only: [:index, :destroy, :update, :create]

    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:new, :show, :index, :edit]
    get 'homes/about' => 'homes#about', as: '/about'
  end

  devise_for :customers, skip: [:passwords], controllers: { # skip オプションを使用し不要なルーティングを削除
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
