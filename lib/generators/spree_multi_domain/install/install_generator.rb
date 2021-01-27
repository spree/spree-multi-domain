module SpreeMultiDomain
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :migrate, type: :boolean, default: true, banner: 'Migrate the database'
      
      def add_migrations
        run 'rake railties:install:migrations FROM=spree_multi_domain'
      end

      def run_migrations
        if options[:migrate]
          run 'bundle exec rails db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
