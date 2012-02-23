# @author : Harsha Sawant
# @date : 7th Jan 2012

class BetaInvite::BetaInviteController < ApplicationController
 
  
  before_filter :authenticate, :only => :invites

  # Default layout 
  layout Proc.new {|controller| controller.request.xhr? ? false : 'beta_invite' }
  
  respond_to :json, :js, :html
  
  def invites
    # @beta_invites = BetaInvite::BetaInvite.all
    @beta_invites = BetaInvite::BetaInvite.order("beta_invites.created_at DESC").page(params[:page]).per(4)
    @app_name     = BetaInviteConfig.app_name
    render :index
  end
  
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
  
  protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
    username == "admin" && password == "admin"
  end
end
end
