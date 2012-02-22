require 'rails/generators'
require 'rails/generators/migration'

module BetaInvite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      def self.next_migration_number(dirname) #:nodoc:
        #adding different version number for the every next migration file
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      # This method is pulling all of the migration data from the migration.rb template.
      # After it pulls the migration date, it generates a migration in the main application
      # You can change the name of this if and when you make your own engine.
      def create_migration_file
        #migration_template 'migration.rb', 'db/migrate/create_beta_invite_model_data.rb'
        #pulling all the migration templates and generating migartion file for each
        
        migration_template 'create_beta_invites.rb', 'db/migrate/create_beta_invites.rb' if (Dir.glob("db/migrate/[0-9]*_*.rb").grep(/\d+_create_beta_invites.rb$/).first).nil?
      end
      
      #copy the initializer file to load the beta_invite.yml mentioned in BetaInviteConfig variable
      #available across the app.
      def copy_initializer_file
        copy_file "beta_invite.rb" , "#{Rails.root}/config/initializers/beta_invite.rb"
      end
      
      #copy the YAML file to configure "from" and "to" email addresses and "app_name"
      def copy_configuration_yaml_file
        copy_file "beta_invite.yml" , "#{Rails.root}/config/beta_invite.yml"
      end

      #copy locales to change javascript messages among others as when needed on demand for the app_user
      def copy_locales
        copy_file "beta_invite.en.yml" , "#{Rails.root}/config/locales/beta_invite.en.yml"
      end
    end
  end
end