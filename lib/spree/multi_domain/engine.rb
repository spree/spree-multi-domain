module Spree
  module MultiDomain
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'spree_multi_domain'

      def self.activate

        #override search to make it multi-store aware
        require 'spree/search/multi_domain'
        Spree::Config.searcher_class = Spree::Search::MultiDomain

        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/spree/*_decorator*.rb")) do |c|
          Rails.env.production? ? require(c) : load(c)
        end

        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/overrides/*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end

      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end

