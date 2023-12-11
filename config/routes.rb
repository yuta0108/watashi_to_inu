Rails.application.routes.draw do

  root to: 'public/homes#top'

  namespace :admin do
    resources :orders, omly: [:show]
    resources :customers, only: [:index, :edit]
    resources :genres, only: [:index, :create,  :update, :edit]
    resources :items, only: [:new, :show, :index, :edit, :create, :update]
    resources :customers, only: [:index, :edit]
    get '/' => 'customers#index'
  end

  namespace :public do
    resources :orders, only: [:confirm, :show, :index, :thanks]
    resources :items, only: [:show, :index,]
    resources :cart_items, only: [:index, :destroy, :update, :create]
      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :customers, only: [:show, :edit]
      get 'customers/my_page' => 'customers#show'
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
