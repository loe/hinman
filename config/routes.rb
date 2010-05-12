ActionController::Routing::Routes.draw do |map|
  map.resources :teams, :has_many => :players
  map.resources :fleets, :has_many => :boats
  
  map.resource :rotation
  
  map.root :controller => :teams, :action => :index
end
