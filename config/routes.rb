Rails.application.routes.draw do
  
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'pages/show'
  get 'pages/grammar' => "pages#grammar"
  get 'pages/modern' => "pages#modern"

  get 'quizes/new' => "quizes#new"
  get 'quizes/:id/edit' => "quizes#edit"
  get 'quizes/:id/answer' => "quizes#answer"
  get 'quizes/:level/:theme/:road' => "quizes#road"
  get 'quizes/:genre_id/:subgenre_id/:thirdgenre_id/:level/:id' => "quizes#show"

  post 'pages/:id/answer' => "pages#answer"
  post 'quizes/:id/answer' => "quizes#answer"
  post 'quizes/create' => "quizes#create"
  post 'quizes/:id/update' => "quizes#update"
  post 'quizes/:id/destroy' => "quizes#destroy"
  post 'stocks/:quiz_id/create' => "stocks#create"
  post 'stocks/:quiz_id/destroy' => "stocks#destroy"
  post 'stocks/:quiz_id/destroy2' => "stocks#destroy2"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
