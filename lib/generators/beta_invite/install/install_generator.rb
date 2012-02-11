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
        #        if ActiveRecord::Base.timestamped_migrations
        #          Time.now.utc.strftime("%Y%m%d%H%M%S")
        #        else
        #          "%.3d" % (current_migration_number(dirname) + 1)
        #        end
        
        
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
        migration_template 'create_delayed_jobs.rb', 'db/migrate/create_delayed_jobs.rb' if (Dir.glob("db/migrate/[0-9]*_*.rb").grep(/\d+_create_delayed_jobs.rb$/).first).nil?
      end
      
      
      def copy_scripts_file
        #copy_file "app/script/beta_invite/delayed_job", "app/script/delayed_job"  if Dir.glob("app/script/delayed_job").first.nil?
      end
      # this will copy the beta_invite.seeds.rb from engine to applicatio
      # rake db:seed:beta_invite
      
      def copy_seed_file
      end
      
      # this will require the beta_invite.seeds.rb inside applications db/seeds.rb
      # rake db:seed
      
      def prepend_require_to_seed_file
      end
      
      
    end
    
    
  end
end
