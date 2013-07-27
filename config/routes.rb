CupidiconTest::Application.routes.draw do
  
  get "assignments/reauthorization"

  get "assignments/resubmit"

  get "assignments/revision"

  get "assignments/published"

  get "assignments/authorize"

  get "assignments/write"

  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  post "assignments/:id/renew", to: 'assignments#renew'

  post "assignments/:id/cancel", to: 'assignments#cancel'

  post "assignments/:id/write", to: 'assignments#write'

  post "assignments/:id/authorize", to: 'assignments#authorize'

  post "assignments/:id/published", to: 'assignments#published'

  post "assignments/:id/reject", to: 'assignments#reject'

  post "assignments/:id/resubmit", to: 'assignments#resubmit'

  post "assignments/:id/revision", to: 'assignments#revision'

  post "assignments/:id/reauthorization", to: 'assignments#reauthorization'

  root :to => 'welcome#index'
end
