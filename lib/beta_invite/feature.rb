module BetaInvite

  class Feature

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def name
      self.source[/^Feature: (.+)$/, 1] || name_lines.first.split(':', 2).second.strip
    end

    def to_param
      relative_path.sub(/^\//, '').sub(/\.feature$/, '')
    end

    def source
      File.read(@path).to_s
    end
    
    def ==(other)
      to_param == other.to_param
    end

  private

    def relative_path
      File.expand_path(path).sub(Courgette.feature_root, '')
    end

  end

end
