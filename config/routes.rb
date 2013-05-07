EzPetSitting::Application.routes.draw do

  scope :path=>"email", :controller=>"email" do
    post "send_and_save"
    get 'open'
  end

  scope :path=>"profiles", :controller=>"profiles" do
    post "create_address"
  end

  scope :path=>"pets", :controller=>"pets" do
    get "destroy"
  end
  
  scope :path=>"appointments", :controller=>"appointments" do
    post "update_appointment"
    get "cancel"
  end

  scope :path=>"users", :controller=>"users" do
    get "create_account"
    post "login"
    get "logout"
  end

  resources :appointments
  resources :calendar
  resources :profiles
  resources :services
  resources :pets
  resources :email
  resources :contracts
  resources :about
  resources :pet
  resources :users
  root :to=>"users#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
