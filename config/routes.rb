Myapp1::Application.routes.draw do
  resources :users
  resources :comment
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
   root :to => 'welcome#index'
   match '/loged' => 'posts#index', as: 'loged'
   match '/logout' => 'welcome#logout', as: 'logout'
   match '/reg' => 'welcome#reg', as: 'reg'
   match '/newpost' => 'posts#newpost', as: 'newpost'
  match '/deletecomments' => 'users#deletecomments', as: 'deletecomments'
  match '/comments/:id' => 'comment#index',as: 'comments'
    match '/newcom' => 'comment#newcom', as: 'newcom'
  match '/friend/:email' => 'friend#index', as: 'frpage'
  match '/friend/:email/newfriend' => 'friend#newfriend', as: 'friend'
  match '/friend/:email/addfriend' => 'friend#addfriend', as: 'addfriend'
  match '/friend/:email/deletefriends' => 'friend#deletefriends', as: 'deletefriends'
  match '/friend/:email/delfriend' => 'friend#delfriend', as: 'delfriend'

  match '/friend/:email/friends_posts' => 'friend#friends_posts', as: 'friends_posts'

  # match 'str' => 'welcome#str'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end
