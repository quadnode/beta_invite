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
      flash[:alert] = nil
  	  flash[:notice] = t('beta_invite.messages.thank_you')
      respond_with(@beta_invite)
  	  send_beta_invite_email
    else
      flash[:notice] = nil
      flash[:alert] = t('beta_invite.messages.sorry')
      respond_with(@beta_invite)
  	end
  end

  
  private
   
  def send_beta_invite_email
    begin
      total_count = BetaInvite::BetaInvite.count
      BetaInvite::SignUpMailer.beta_invites_requested(@beta_invite , total_count).deliver
    rescue Exception => e
      Rails.logger.error ("Unable to send Beta Invite Mail")
    end
	end
end
