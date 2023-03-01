Rails.application.routes.draw do
  namespace :admin do
    resources :comments, only: [:index, :destroy]
    resources :users, only: [:show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :trip_plans, only: [:new, :create, :index, :edit, :update, :destroy]do
    end

    get '/users' => 'users#index'
    get '/users/my_page' => 'users#show'
    get '/users/information/edit' => 'user#edit'
    patch '/users/information' => 'users#pudate'
    get '/users/stop' => 'users#stop'
    patch '/users/withdraw' => 'users#withdraw'
    get '/users/:id/follows' => 'users#follow'
    get '/users/:id/followers' => 'users#follower'

    resources :reviews, only: [:show, :edit, :update]do
    end

    resources :comments, only: [:index, :create, :edit, :update, :destroy]do
    end

    resources :likes, only: [:create, :destroy]do
    end

    resources :relationships, only: [:create, :destroy]do
    end
  end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
