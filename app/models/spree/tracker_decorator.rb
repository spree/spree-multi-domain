Spree::Tracker.class_eval do
  belongs_to :store

  def self.current(domain=nil)
    if domain
      Spree::Tracker.where(:active => true, :environment => Rails.env).joins(:store).where("spree_stores.url LIKE ?", "%#{domain}%").first
    else
    
      tracker = where(active: true, environment: Rails.env).first
      tracker.analytics_id.present? ? tracker : nil if tracker
      
    end 
  end
end
