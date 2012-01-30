Spree::Core::Engine.routes.prepend do

  namespace :admin do
    resources :stores
  end

end
