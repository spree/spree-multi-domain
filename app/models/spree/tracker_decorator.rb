Spree::Tracker.class_eval do
  belongs_to :store

  def self.current(domain)
    # , :environment => Rails.env
    Spree::Tracker.where(:active => true).joins(:store).where("spree_stores.url LIKE ?", "%#{domain}%").first
  end
end
