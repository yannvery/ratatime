Rails.application.routes.draw do
  resources :trackers, except: :show
  resources :projects, except: :show
  root 'trackers#index'
end
