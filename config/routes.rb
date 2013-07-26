CupidiconTest::Application.routes.draw do
  
  get "assignments/write"

  get "assignment/write"

  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  post "assignments/:id/renew", to: 'assignments#renew'

  root :to => 'welcome#index'
end
