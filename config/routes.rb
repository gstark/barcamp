ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resource :session
  
  map.root :controller => 'schedule'
  map.resources :talks, :rooms, :sponsors, :schedule
  
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller.:format'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
