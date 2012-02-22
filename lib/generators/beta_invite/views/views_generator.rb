require "rails/generators"

module BetaInvite
	module Generators
		class ViewsGenerator < Rails::Generators::Base
			def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end		
      
      # generate beta_invite view files except layout files so as to modify 
      # the look and feel on demand.	
      def copy_view_files
      	directory "beta_invite" , "#{Rails.root}/app/views/beta_invite"
      end
		end
	end
end