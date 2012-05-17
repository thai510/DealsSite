Offerglass::Application.routes.draw do
 




  get "home/index"

  resources :organizations

  match "/apply", :to => 'organizations#new'
  match "/thankyou", :to => 'home#index'

  resources :customers

  resources :vouchers

  resources :non_profits, :path => "/np" 
  controller :non_profits do
    get "/list" => :list
  end

  get "store/index"

  
  resources :offers do 
    member do
      get 'live'
      get 'thankyou'
      delete "stop_offer"
      delete "start_offer"
    end
  end


  controller :business_portal do
    get "/b/login" => :login
    post "/b/login" => :login_post
    get "/b/redeem" => :redeem
    post "/b/redeem" => :redeem_create
    get "/b/cp" => :business_change_password_view
    put "/b/cp" => :business_change_password_save
    delete "logout_business" => :destroy
  end

  match "businesses/:id" => 'businesses#reset_password', :via => :post

  get "admin_session/create"

  get "admin_session/destroy"



  resources :admins, :path => '/ogadmin'
  controller :admin_session do
    get 'enter' => :enter 
    post 'enter' => :create
    delete 'logout_admin' => :destroy
   end

  resources :businesses
  root :to => 'customers#new'
  

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
  # match ':controller(/:action(/:id(.:format)))'
end
