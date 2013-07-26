CupidiconTest::Application.routes.draw do
  
  get "assignments/write"

  get "assignment/write"

  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  post "assignments/:id/renew", to: 'assignments#renew'

  post "assignments/:id/write", to: 'assignments#write'

  root :to => 'welcome#index'
end
