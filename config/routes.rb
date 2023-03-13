Rails.application.routes.draw do
  namespace :admin do
    resources :comments, only: [:index, :destroy]
    resources :users, only: [:show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :trip_plans, only: [:new, :create, :show, :edit, :update, :destroy]do
      collection do
        get :research
      end
      resources :trip_plan_details, only: [:new, :create, :edit, :update]do #trip_plan_detailをネストさせている（trip_planの投稿に紐づけさせるため）
      end
      resource :likes, only: [:create, :destroy]do #likeをネストさせている（trip_planの投稿に紐づけさせるため）,resourceを単数形にすると:idが含まれなくなる
      end
      resources :comments, only: [:create, :edit, :update, :destroy]do #commentをネストさせている（trip_planの投稿に紐づけさせるため）
      end
    end

    get '/users' => 'users#index'
    get '/users/my_page' => 'users#my_page'
    get '/users/information/edit' => 'user#edit'
    patch '/users/information' => 'users#pudate'
    get '/users/stop' => 'users#stop'
    patch '/users/withdraw' => 'users#withdraw'
    get '/users/:id/follows' => 'users#follow'
    get '/users/:id/followers' => 'users#follower'

    resources :users, only: [:show]do
      member do
        get :likes
      end
    end

    resources :trip_plan_details, only: [] do
      resource :reviews, only: [:show, :edit, :update]do
      end
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

#ゲストログイン機能
devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
