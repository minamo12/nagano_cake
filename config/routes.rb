Rails.application.routes.draw do

  scope module: 'public' do
    # homes
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    #items
    resources :items, only: [:index, :show]

    # customers
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw'  => 'customers#withdraw'

    #cart_items
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all'

    #orders
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'order/complete' => 'orders#complete'

    #addresses
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
