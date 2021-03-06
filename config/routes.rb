Hinman::Application.routes.draw do
  resources :teams do
    resources :players
  end
  
  resources :fleets do
    resources :boats
  end
  
  resources :rotations do
    resources :races do
      resource :finish
    end
  end  
  
  match 'rotations/multiple/*id' => 'rotations#multiple'
  
  match '/' => 'rotations#index'
end
