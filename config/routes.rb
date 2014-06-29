Rails.application.routes.draw do
  resources :users, :only => [:create]
  root to: "users#welcome"
end
