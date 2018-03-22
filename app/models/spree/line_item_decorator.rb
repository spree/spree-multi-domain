Spree::LineItem.class_eval do
  def update_price
    self.price = variant.price_in(currency || Spree::Config[:currency]).price_including_vat_for(tax_zone: tax_zone)
  end
end
