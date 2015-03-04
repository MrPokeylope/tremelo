Rails.application.routes.draw do
  resources :tags

  get 'user_bands/destroy'

  get 'user_bands/edit'

  get "/login" => "user_sessions#new", as: :login
  get "/register" => "users#new", as: :register
  get "/logout" => "user_sessions#destroy", as: :logout
  delete "/logout" => "user_sessions#destroy"

  get 'users/leave_band' => "users#leave_band"
  get 'users/:id/upload_pic' => "users#upload_pic"
  get 'users/nearby_users' => "users#index"

  get 'users/:id/edit_tags' => "users#edit_tags"
  get 'users/:id/access_error' => 'users#access_error'

  get 'search_user' => 'users#search'
  get 'users/search_results' => 'users#search_results'

  get 'bands/:id/upload_pic' => 'bands#upload_pic'
  get 'bands/:id/access_error' => 'bands#access_error'
  get 'bands/:id/search_for_user' => 'bands#search_for_user'

  get 'search_user' => 'users#search'
  get 'users/search_results' => 'users#search_results'

  
  
  resources :users do
    collection do
      post 'update_pic'
      put 'update_tags'
      get 'search'
      post 'search_results'
    end
  end

  resources :bands do
    member do
      get 'search_for_user'
      post 'user_search_results'
      get 'user_search_results'
      put 'add_member'
      get 'edit_videos'
      put 'update_videos'
    end
    collection do
      post 'upload_pic'

    end

    collection do
      get 'access_error'
    end
  end
  resources :userbands
  resources :usertags

  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'

  get 'help/creating_account' => 'static_pages/help#creating_account'
  get 'help/basic_site_nav' => 'static_pages/help#basic_site_nav'

  resources :static_pages do
    resources :help do
      collection do
        get 'creating_account'
      end
    end
  end

  resources :videos

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
