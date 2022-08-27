Rails.application.routes.draw do

  scope module: 'public' do
    resources :items, only: [:index, :show]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  namespace :admin do
    resources :orders, only: [:index, :show]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
