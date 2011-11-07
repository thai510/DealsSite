LocalAdResource::Application.routes.draw do
  resources :facebook_share_codes

  post 'facebook_share_codes/checkAndValidateFBCode'

  get "purchase_session/new"

  get "purchase_session/create"

  get "purchase_session/destroy"

  resources :vouchers

  resources :private_deal_codes

  resources :prev_publishes, :path => 'pd'

  resources :db_publishes, :path => 'live'

  resources :db_step_zeros, :path => 'zero'

  resources :form_tips

  resources :db_step_fours, :path => 'four'

  resources :db_step_threes, :path => 'three'

  resources :db_step_twos, :path => 'two' 
  
  resources :db_step_ones, :path => 'one'

  resources :locations

  resources :industry_restrictions

  resources :standard_restrictions

  resources :industries

  get "admin/index"


  controller :sessions do

  #get "login/index" => :new
  post "login/index" => :create
  delete "logout" => :destroy
  end
  
  controller :private_deal_session do
    post "private" => :create
    delete "private" => :destroy
  end

  get "login/index"

  match 'users/check_email', :to => 'users#check_email', :as => 'users/check_email'
  match 'private', :to => 'private#index', :as => 'private'
  resources :users

  get "sign_up/index"

  get "eula/index"

  resources :review_entries

  get "review_entries/new"

  get "reviews/index"

  resources :calculator_tools

  resources :comparison_tools

  resources :deal_builders, :path => 'db' 

  resources :marketing_plans

  get "resources/index"

  resources :faqs

  resources :links

  resources :samples

  resources :tutorials

  get "learning_center/index"

  resources :feedbacks

  get "contact/contact_us"

  get "learning_center/run_a_deal"
 
  get "learning_center/getting_started"
  
  get "learning_center/which_provider"

  get "learning_center/profit_drivers"

  get "learning_center/offer_structure"

  get "learning_center/before_and_during"

  get "learning_center/ask_a_question"

  get "learning_center/follow_up"

  get "home/index"

  get "contact/about_us"

  get "contact/blog"


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
  # root :to => "welcome#index"
    root :to => "home#index", :as => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
