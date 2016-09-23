Spree::Admin::TaxonomiesController.class_eval do
  update.before :set_stores
  before_action :find_stores, only: [:update]

  private

  def set_stores
    @taxonomy.store_ids = nil unless params[:taxonomy].key? :store_ids
  end

  def find_stores
    store_ids = params[:taxonomy][:store_ids]
    if store_ids.present?
      params[:taxonomy][:store_ids] = store_ids.split(',')
    end
  end

end

