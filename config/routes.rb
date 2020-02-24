Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'card/edit'
  

  # カード登録ルーティング
  resources :card, only: [:new, :edit, :show] do
  collection do
    post 'show', to: 'card#show'
    post 'pay', to: 'card#pay'
    post 'delete', to: 'card#delete'
  end
end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }


devise_scope :user do
  get 'addresses', to: 'users/registrations#new_address'
  # マークアップ用temporary routesです。アドレスを登録する画面（edit_addressと見た感じ変わらん）。ここから（なぜあるのか謎っw）
  get 'tmp_address', to: 'users/registrations#tmp_address'
  # ここまで
  # マークアップ用temporary routesです。アドレスを登録する画面。ここから
  get 'edit_address', to: 'users/registrations#edit_address'
  # ここまで
  post 'addresses', to: 'users/registrations#create_address'
  # マークアップ用temporary routesです。ここから
  get 'sms_confirmation', to: 'users/registrations#sms_confirmation'
  get 'sms_recieved', to: 'users/registrations#sms_recieved'
  get 'tmp_register_credit_card', to: 'card#pay'
  get 'complete', to: 'users/registrations#complete'
  get 'register_address', to: 'users/registrations#register_address'
  get 'tmp_signup', to: 'users/registrations#tmp_signup'  
  # ここまで
end
  root "items#index"
  resources :mypages, only: [:show,:edit,:logout]
  resources :users, only: [:index,:new, :show, :edit, :update]
  resources :addresses, only: [:new, :create]
  resources :items, only: [:show]
  resources :purchase, only: [:show] do
    collection do
      get 'show', to: 'purchase#show'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  post "/", to: "purchase#pay"
  resources :items, only: [:show, :new, :create]
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:show] 
  resources :items, only: [:show, :new, :create]

 

  resources :registrations do
    collection do
      post 'show', to: 'card#show'
      post 'tmp_register_credit_card', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'card_new', to: 'card#new'
    end
  end

  
  

end
