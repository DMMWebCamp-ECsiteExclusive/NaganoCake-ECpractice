Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

# 管理者用ルート設定
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get '/' => 'homes#top'
  end

# 顧客用ルート設定
  # namespace :public do
    get '/addresses' => 'addresses#index'
    get 'addresses/:id/edit' => 'addressed#edit'
    resources :addresses, only: [:create, :update, :destroy]
  # end
  # namespace :public do
    get 'orders/thanks'
    get 'orders/confirm'
    resources :orders, only: [:new, :create, :index, :show]
  # end
  namespace :public do
    get 'cart_items/index'
  end
  # namespace :public do
    get 'customers/mypage' => 'cutomers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'cutomers/confirm'
    resources :customers, only: [:update, :resign]
  # end
  namespace :public do
    get 'items/index'
    get 'items/show'
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
