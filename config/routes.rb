Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

# 管理者用ルート設定
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    get '/' => 'homes#top'
  end

# 顧客用ルート設定
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destory]
  end
  scope module: :public do
    resources :orders, only: [:new, :index, :show]
    get '/orders/thanks' => 'orders#thanks'
    post '/orders/confirm' => 'orders/confirm'
  end
  scope module: :public do
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  scope module: :public do
    patch '/customers/resign' => 'customers#resign'
    resources :customers, only: [:update]
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    get '/customers/confirm' => 'customers#confirm'
  end
  scope module: :public do
    resources :items, only: [:index, :show]
  end

# 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

# 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
