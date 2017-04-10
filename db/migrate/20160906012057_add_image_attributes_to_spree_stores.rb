class AddImageAttributesToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :logo_content_type, :string
    add_column :spree_stores, :logo_file_size, :string
    add_column :spree_stores, :logo_width, :string
    add_column :spree_stores, :logo_height, :string
    add_column :spree_stores, :logo_updated_at, :datetime
  end
end
