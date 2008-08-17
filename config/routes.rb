ActionController::Routing::Routes.draw do |map|

  map.connect ':controller/:action/:id'
  map.connect ':controller.:format'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
