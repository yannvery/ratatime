Rails.application.routes.draw do
  resources :trackers
  root 'trackers#index'
end
