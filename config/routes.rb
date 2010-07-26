Hinman::Application.routes.draw do
  resources :teams do
    resources :players
  end
  
  resources :fleets do
    resources :boats
  end
  
  resources :rotations do
    resources :races
  end  
  
  match '/' => 'rotations#index'
end
