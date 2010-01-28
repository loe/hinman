ActionController::Routing::Routes.draw do |map|
  map.resources :players
  map.resources :teams

  map.root :controller => :teams, :action => :index
end
