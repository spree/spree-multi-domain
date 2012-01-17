module Spree
  module MultiDomain
    class Migration < ActiveRecord::Migration

      class << self 

        def table_exists?( name )
          ActiveRecord::Base.connection.tables.include?( name.to_s )
        end

        def select_table( namespace, name )
          (table_exists?( "#{namespace}_#{name}" ) ? "#{namespace}_#{name}" : name).to_sym
        end

        def namespaced_table_to_class( name ) 
          name.to_s.singularize.sub('_','/').camelize.constantize
        end

        def column_exists?( table, name )
          namespaced_table_to_class( table ).column_names.include?( name.to_s )
        end

      end

    end
  end
end
