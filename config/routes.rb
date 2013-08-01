CupidiconProduction::Application.routes.draw do
  
  get "assignments/confirm"

  get "assignment/confirm"

  get "user/available"

  get "user/engaged"

  get "assignments/reauthorization"

  get "assignments/resubmit"

  get "assignments/revision"

  get "assignments/published"

  get "assignments/authorize"

  get "assignments/write"

  devise_for :users

  resources :assignments

  match "about" => 'welcome#about', via: :get

  match "need_content" => "welcome#need_content", via: :get

  match "write_content" => "welcome#write_content", via: :get

  match "loves_lexicon" => "welcome#loves_lexicon", via: :get 

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
