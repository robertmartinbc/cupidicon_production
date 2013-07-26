CupidiconTest::Application.routes.draw do
  
  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  post "assignments/:id/renew", to: 'assignments#renew'

  root :to => 'welcome#index'
end
