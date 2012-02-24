$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
module BetaInvite
 # This require basically states that we're going to require the engine
  # if you are using rails and your rails version is 3.x..
  require 'beta_invite/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  #require 'kaminari'  
  autoload :Feature, 'beta_invites/feature'

  class << self
    def features
      Dir.glob(File.join(feature_root, '**/*.feature')).map do |file|
        Courgette::Feature.new(file)
      end
    end
    
    def first
      features.first
    end

    def feature_folders(path = '')
      basenames_for_feature_folders_in(path).reject{ |f| %w(step_definitions support).include?(f) }
    end

    def feature_filenames(path = '')
      basenames_for_feature_files_in(path).map{ |path| path.sub('.feature', '')}
    end

    def find(param)
      features.find { |f| f.to_param == param }
    end

    def feature_root
      Rails.root.join('features').to_s
    end

    private

      def basenames_for_feature_folders_in(path)
        basenames_for path, "/*/"
      end

      def basenames_for_feature_files_in(path)
        basenames_for path, "/*.feature"
      end

      def basenames_for(path, pattern)
        folder_relative_path = File.join(feature_root, path)
        Pathname.glob("#{folder_relative_path}#{pattern}").map{ |f| f.basename.to_s }
      end
  end
  
end
