module ActionView
  class TemplateRenderer
    def find_layout_with_multi_store(layout, locals)
      current_store = @view.controller.send(:current_store) rescue nil
      store_layout = layout
      if current_store && !@view.controller.is_a?(Spree::Admin::BaseController)
        store_layout = layout.gsub("layouts/", "layouts/#{current_store.code}/")
      end
      begin
        find_layout_without_multi_store(store_layout, locals)
      rescue ::ActionView::MissingTemplate
        find_layout_without_multi_store(layout, locals)
      end
    end
    alias_method_chain :find_layout, :multi_store
  end
end
