# Load YAML file to configure "from" and "to" email address configurations.
require 'ostruct'
yaml_file_path = File.expand_path("#{Rails.root}/config/beta_invite.yml", __FILE__)
if FileTest.exist?(yaml_file_path)
	BetaInviteConfig = OpenStruct.new(YAML.load_file("#{Rails.root}/config/beta_invite.yml")[Rails.env].symbolize_keys) 	
else
	Rails.logger.error "The Yaml file has not been copied. Trying rails generate beta_invite:install again."
end