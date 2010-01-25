ActionController::Routing::Routes.draw do |map|
  map.resources :teams

  map.root :controller => :teams, :action => :index
end
