#Refinery::Application.routes.draw do
#  resources :translations

#  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
#    resources :translations do
#      collection do
#        post :update_positions
#      end
#    end
#  end
#end

ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :translations
  end
end
