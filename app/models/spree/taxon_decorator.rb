Spree::Taxon.class_eval do

  def store_code
    taxonomy.store.code
  end
  
end
