# Load YAML file to configure "from" and "to" email address configurations.
require 'ostruct'
app_path = File.expand_path("#{Rails.root}/config/beta_invite.yml", __FILE__)
	if FileTest.exist?(app_path)
		BetaInviteConfig = OpenStruct.new(YAML.load_file("#{Rails.root}/config/beta_invite.yml")[Rails.env].symbolize_keys) 	
	else
 		BetaInviteConfig = OpenStruct.new(YAML.load_file("#{$BETAINVITE_PATH}/config/beta_invite.yml")[Rails.env].symbolize_keys)	
	end