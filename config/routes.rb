# coding: utf-8 
EnterpriseSite::Application.routes.draw do   
  themes_for_rails
  
  resources :news, :only => [:index, :show]

  resources :feedbacks, :only => [:index, :new, :create]
  
  get "contract-us" => "feedbacks#new"
  
  resources :notices, :only => [:index, :show]

  
  match '/pages/:url_slug' => 'pages#show'

  resources :products, :only => [:index, :show] do
    member do 
      get "category"
    end
  end
  
  # resource :admin_session # 系统登录   
  get "/admin_login" => "admin_sessions#new", :as => :admin_login
  post "/admin_login" => "admin_sessions#create"
  delete "/admin_logout" => "admin_sessions#destroy", :as => :admin_logout

  get "syspanel/home/index" => "syspanel/home#index"  
  
  namespace :syspanel do
    resources :feedbacks    
    resources :categories
    resources :attachments
    resources :site_settings do
      collection do
        get "basic"
        get "contact_info"
        post "batch_update"
      end
    end 
    resources :pages
    resources :navmenus, :except => [:show] do
      collection do
        post "sort"
      end
    end
    resources :notices  
    resources :products
    resources :product_configrations
    resources :news
    resources :admins
  end

  root :to => "home#index"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
