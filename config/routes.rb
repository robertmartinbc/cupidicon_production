CupidiconTest::Application.routes.draw do
  
  get "assignments/authorize"

  get "assignments/write"

  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  post "assignments/:id/renew", to: 'assignments#renew'

  post "assignments/:id/cancel", to: 'assignments#cancel'

  post "assignments/:id/write", to: 'assignments#write'

   post "assignments/:id/authorize", to: 'assignments#authorize'

  root :to => 'welcome#index'
end
