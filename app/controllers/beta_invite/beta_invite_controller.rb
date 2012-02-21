# @author : Harsha Sawant
# @date : 7th Jan 2012

class BetaInvite::BetaInviteController < ApplicationController
  
  # Default layout 
  layout Proc.new {|controller| controller.request.xhr? ? false : 'beta_invite' }
  
  respond_to :json, :js, :html
  
   def new
		@beta_invite = BetaInvite::BetaInvite.new
	end

	def create
  	@beta_invite = BetaInvite::BetaInvite.new(params[:beta_invite])
  	if @beta_invite.save
  	  flash[:notice] = "Thank you for signing up with us. We will keep you updated."    
  	  respond_with(@beta_invite)
  	  send_beta_invite_email
  	end
  end

  
  private
   
  def send_beta_invite_email
    begin
    puts @beta_invite
	   total_count = BetaInvite::BetaInvite.count
	   BetaInvite::SignUpMailer.delay.beta_invites_requested(@beta_invite , total_count)
    rescue Exception => e
      Rails.logger.error ("Unable to send Beta Invite Mail")
    end
	end
end
