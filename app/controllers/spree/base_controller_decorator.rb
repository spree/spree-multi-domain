Spree::BaseController.class_eval do 

  before_filter :add_current_store_id_to_params
  helper_method :current_store
  helper_method :current_tracker

  private

  def current_store
    @current_store ||= Spree::Store.current(request.host)
  end

  def current_tracker
    @current_tracker ||= Spree::Tracker.current(request.host)
  end

  def get_taxonomies
    @taxonomies ||= current_store.present? ? Spree::Taxonomy.where(["store_id = ?", current_store.id]) : Spree::Taxonomy
    @taxonomies = @taxonomies.find(:all, :include => {:root => :children})
    @taxonomies
  end

  def add_current_store_id_to_params
    params[:current_store_id] = current_store.try(:id)
  end

end

