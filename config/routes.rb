Hinman::Application.routes.draw do
  resources :teams
  resources :fleets
  resource :rotation
  match '/' => 'teams#index'
end
