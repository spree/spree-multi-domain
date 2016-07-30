Deface::Override.new(virtual_path: 'spree/admin/shared/sub_menu/_configuration',
                     name: 'add_stores_to_admin_menu',
                      :original => '41c9125ad4022e7dac858458620c2a141e4f49d0',
                     insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
                     text: '<%= configurations_sidebar_menu_item Spree.t(:stores_admin), spree.admin_stores_url %>')
