
require "rails"
require 'seedbank'

module BetaInvite
  #beta invite  Engine root path
  BETAINVITE_PATH = File.expand_path("../../../", __FILE__)
  
  class Engine < Rails::Engine
    

    config.autoload_paths << File.expand_path("../beta_invite/lib/beta_invite", __FILE__)
    config.autoload_paths << File.expand_path("../../../config/initializers", __FILE__)
    
    config.autoload_paths << File.expand_path("../lib/beta_invite", __FILE__)
    
    
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
      
    
    # We can add all of the public assets from our engine and make them
    # available to use.  This allows us to use javascripts, images, stylesheets
    # etc.
    initializer "static assets" do |app|
      #app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    end
    
    
    #generators for engine models and views
    
    config.app_generators do |g|
      g.orm             :active_record
      g.template_engine :erb
    end
 
  end
end


 

