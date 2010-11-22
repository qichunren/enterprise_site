# coding: utf-8 
EnterpriseSite::Application.routes.draw do
  
  resources :news, :only => [:index, :show]

  resources :feedbacks, :only => [:index, :new, :create]
  
  get "contract-us" => "feedbacks#new"
  
  resources :notices, :only => [:index, :show]

  
  match '/pages/:url_slug' => 'pages#show'

  resources :categories

  resources :products, :only => [:index, :show]
  
  resource :admin_session # 系统登录   

  get "syspanel/home/index" => "syspanel/home#index"  
  
  namespace :syspanel do
    resources :feedbacks    
    resources :categories
    resources :attachments
    resources :site_settings 
    resources :pages
    resources :navmenus, :except => [:show]
    resources :notices  
    resources :products
    resources :news
  end

  root :to => "home#index"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
