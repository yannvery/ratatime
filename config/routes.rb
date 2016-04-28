Rails.application.routes.draw do
  resources :trackers
  resources :projects
  root 'trackers#index'
end
