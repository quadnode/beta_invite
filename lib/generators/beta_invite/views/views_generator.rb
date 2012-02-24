require "rails/generators"

module BetaInvite
	module Generators
		class ViewsGenerator < Rails::Generators::Base
      # Views generators to generates views for beta invite landing page and
      # /beta_invites page to display tables along with mailing templates.

      # A samll description of the generator for the --help command in terminal.
      desc "Generates all view files for beta_invite page"
			def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end		
      
      def copy_view_files
      	directory "beta_invite" , "#{Rails.root}/app/views/beta_invite"
      end
		end
	end
end