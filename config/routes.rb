Rails.application.routes.draw do
#  map.resources :admin, :collection => { :pets => :get, :post_data => :post }
  get 'admin/home'
  get 'admin/index'
  get '/admin/jgdata'
  get 'profile/home'
#https://github.com/johncorderox/Logistics
  root 'user#home'
  #resources :states, only: :index
  resources :user, only: [:new, :create, :edit, :update]
  resource :sessions, only: [:create, :destroy]
  resources :auctions, only: [:index, :new, :destroy, :create, :show]
  resources :bids, only: [:create, :destroy]
  resources :dashboards, only: [:index]
  resources :addresses, only: [:create, :update]

  get  "user/customer_signin"
  post  "user/customer_signin"
  get  "user/book"
  post  "user/book"
  get  "user/register"
  post  "user/register"

  get "profile/unverify"
  post "/driversignin", to: "user#driversignin"
  post "/customersignin", to: "user#customersignin"
  get  "user/driver_signin"
  post "user/driver_signin"
#  post "user/subscribe" => "users#subscribe"
 # =>  get '',to: 'user#home'

#  get '#trucks', to: 'user#' 
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
  # get 'user/home'
  # get 'user/create'
  # get 'user/subscribe'
  # get 'user/new'
  # get 'user/edit'
  # get 'user/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
