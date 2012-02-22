# Load YAML file to configure "from" and "to" email address configurations.
require 'ostruct'
BetaInviteConfig = OpenStruct.new(YAML.load_file("#{Rails.root}/config/beta_invite.yml")[Rails.env].symbolize_keys)