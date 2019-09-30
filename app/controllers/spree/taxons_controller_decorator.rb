module Spree
  module TaxonsControllerDecorator
    def self.prepended(base)
      base.include ::SpreeMultiDomain::MultiDomainHelpers
    end

    def show
      @taxon = Spree::Taxon.find_by_store_id_and_permalink!(current_store.id, params[:id])
      return unless @taxon

      @searcher = build_searcher(params.merge(taxon: @taxon.id))
      @products = @searcher.retrieve_products
      @taxonomies = get_taxonomies
    end
  end
end

::Spree::TaxonsController.prepend ::Spree::TaxonsControllerDecorator
