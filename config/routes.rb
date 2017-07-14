Spree::Core::Engine.routes.append do
  namespace :admin, path: Spree.admin_path do
    resources :stores

    resources :orders do
      member do
        post '/update_store', to: 'orders#update_store'
      end
    end
  end
end
