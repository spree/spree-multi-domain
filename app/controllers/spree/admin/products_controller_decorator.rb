Spree::Admin::ProductsController.class_eval do
 alias :spree_update :update

  def update
    store_ids = params[:product][:store_ids]
    if store_ids.present?
      params[:product][:store_ids] = store_ids.split(',')
    end
    spree_update
  end

end
