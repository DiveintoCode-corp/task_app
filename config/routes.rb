Rails.application.routes.draw do
  root "tasks#mine"
  
  resources :tasks do
    get 'mine', on: :collection
    get 'assign', on: :member
    patch 'assign_update', on: :member
  end
  
  devise_for :users
 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
