CupidiconTest::Application.routes.draw do
  
  resources :assignments

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
