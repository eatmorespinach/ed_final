MyProject::Application.routes.draw do



  get "login" => "sessions#new"
  get "signup" => "users#new"
  # get "profile" => "users#show"
  # get "profile/edit" => "users#edit"
  resources :profiles, only: [:index, :show, :update] do
    resource :contact, only: [:new, :create]
    resources :assets do
      member do
        post :crop
      end
    end
    put 'assets' => "assets#update"
  end

  resources :charges

  get 'myprofile' => "profiles#my_profile"
  get 'myprofile/edit' => "profiles#edit"
  get 'myaccount' => "users#edit"
  get 'mylistings' => "listings#my_listings"
  get 'admin' => "listings#admin_page"
  get 'map' => 'maps#map'
  



  resources :listings do
    resource :contact do
      member do
        post :create_listing 
        get :new_listing
      end
    end
    member do
      post :approve
      post :reactivate
      post :deactivate
    end

    resources :reviews, only: [:show, :create, :new]
    resources :assets
    put 'assets/:id/edit' => "assets#crop"
    put 'assets' => "assets#update"
  end

  resources :users, only: [:new, :create, :destroy, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  
  get "about" => "contents#about"
  get "faq" => "contents#faq"
  get "contact" => "contents#contact"

  root :to => "landing#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
