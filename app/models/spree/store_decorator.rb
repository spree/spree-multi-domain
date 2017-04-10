module Spree
  Store.class_eval do
    has_and_belongs_to_many :products, join_table: 'spree_products_stores'
    has_many :taxonomies
    has_many :orders

    has_many :store_payment_methods
    has_many :payment_methods, through: :store_payment_methods

    has_many :store_shipping_methods
    has_many :shipping_methods, through: :store_shipping_methods

    has_and_belongs_to_many :promotion_rules, class_name: 'Spree::Promotion::Rules::Store', join_table: 'spree_promotion_rules_stores', association_foreign_key: 'promotion_rule_id'
  
    if ActiveRecord::Base.connection.table_exists?(:spree_stores) && ActiveRecord::Base.connection.column_exists?(:spree_stores, :logo_content_type)
      # save the w,h of the original image (from which others can be calculated)
      # we need to look at the write-queue for images which have not been saved yet
      before_save :find_dimensions, if: :logo_updated_at_changed?
  
      has_attached_file :logo,
                        styles: { mini: '48x48>', small: '100x100>', logo: '250x250>', large: '600x600>' },
                        default_style: :logo,
                        url: '/spree/logos/:id/:style/:basename.:extension',
                        path: ':rails_root/public/spree/logos/:id/:style/:basename.:extension',
                        convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  
      validate :no_logo_errors
      validates_attachment :logo,
        content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
  
      def find_dimensions
        temporary = logo.queued_for_write[:original]
        filename = temporary.path unless temporary.nil?
        filename = logo.path if filename.blank?
        geometry = Paperclip::Geometry.from_file(filename)
        self.logo_width  = geometry.width
        self.logo_height = geometry.height
      end
  
      # if there are errors from the plugin, then add a more meaningful message
      def no_logo_errors
        unless logo.errors.empty?
          # uncomment this to get rid of the less-than-useful interim messages
          # errors.clear
          errors.add :logo, "Paperclip returned errors for file '#{logo_file_name}' - check ImageMagick installation or image source file."
          false
        end
      end
    end
  end
end