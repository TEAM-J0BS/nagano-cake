Rails.application.routes.draw do
  namespace :public do
    get 'genres/show'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


scope module: :public do
  root to: "homes#top"
  get "customers/about"=>"homes#about"
  get "search" => "searches#search"
  get "customers/mypage" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
  resources :items,only: [:index,:show] do
    collection do
      get "/search" => "items#search"
    end
  end
  resources :genres, only: [:show]
  resources :cart_items,only: [:index, :update, :destroy, :create] do
    collection do
      delete "destroy_all"
    end
  end
  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post "check"
      get "complete"
    end
  end
  resources :addresses, except: [:show]
end



#管理者側のルーティング設定
namespace :admin do
  get "/" => "homes#top"
  get "search" => "searches#search"
  resources :items,except: [:destroy]
  resources :genres,except:  [:new,:destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :serches, only: [:index]
  resources :orders, only: [:index, :show, :update] do
    member do
      get "individual"
    end
  end
  resources :order_details, only: [:update]
end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
