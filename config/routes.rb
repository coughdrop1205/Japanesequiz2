Rails.application.routes.draw do

  resources :charges
  
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'pages/show'
  get 'pages/privacy'
  get 'pages/commercial'
  get 'pages/term'
  get 'pages/grammar' => "pages#grammar"
  get 'pages/modern' => "pages#modern"

  get 'quizes/new' => "quizes#new"
  get 'quizes/:id/edit' => "quizes#edit"
  get 'quizes/:id/answer' => "quizes#answer"
  get 'quizes/:level/:theme/:road' => "quizes#road"
  get 'quizes/:genre_id/:subgenre_id/:thirdgenre_id/:level/:id' => "quizes#show"


  get 'card/edit'# app/views/card/edit.html.erb画面にアクセス
  post 'card/create'# homeコントローラーのcreateアクション実行

  get 'card/destroy'# app/views/card/destroy.html.erb画面にアクセス
  put 'card/cancel_subscription'# homeコントローラーのcancel_subscriptionアクション実行

  get 'card/restart'# app/views/card/restart.html.erb画面にアクセス
  put 'card/restart_subscription'# homeコントローラーのrestart_subscriptionアクション実行

  get 'card/fin_subscription'# app/views/card/fin_subscription.html.erb画面にアクセス


  post 'pages/:id/answer' => "pages#answer"
  post 'quizes/:id/answer' => "quizes#answer"
  post 'quizes/create' => "quizes#create"
  post 'quizes/:id/update' => "quizes#update"
  post 'quizes/:id/destroy' => "quizes#destroy"
  post 'stocks/:quiz_id/create' => "stocks#create"
  post 'stocks/:quiz_id/destroy' => "stocks#destroy"
  post 'stocks/:quiz_id/destroy2' => "stocks#destroy2"

  #post "products/:id/charge", to: "charges#create", as: "charge"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
