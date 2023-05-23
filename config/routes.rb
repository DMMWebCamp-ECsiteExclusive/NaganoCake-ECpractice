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
  # namespace :public do
    get '/addresses' => 'addresses#index'
    resources :addresses, only: [:create, :edit, :update, :destroy]
  # end
  # namespace :public do
    get 'orders/thanks'
    post 'orders/confirm'
    resources :orders, only: [:new, :create, :index, :show]
  # end
  # namespace :public do
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  # end
  # namespace :public do
    get 'customers/mypage' => 'cutomers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'cutomers/confirm'
    patch '/customers/resign' => 'customers#resign'
    resources :customers, only: [:update]
  # end
  # namespace :public do
    resources :items, only: [:index, :show]
  # end

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
