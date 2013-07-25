CupidiconTest::Application.routes.draw do
  
  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
