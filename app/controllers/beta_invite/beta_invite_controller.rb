# @author : Harsha Sawant
# @date : 7th Jan 2012

class BetaInvite::BetaInviteController < ApplicationController
  
  # Default layout 
  layout Proc.new {|controller| controller.request.xhr? ? false : 'beta_invite' }
end
