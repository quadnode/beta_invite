class BetaInvite::BetaInviteController < ApplicationController
  before_filter :authenticate, :only => :invites

  # Default layout 
  layout Proc.new {|controller| controller.request.xhr? ? false : 'beta_invite' }
  
  respond_to :json, :js, :html

  # display list of beta_invites in a tabular format.
  def invites
    @beta_invites = BetaInvite::BetaInvite.order("beta_invites.created_at DESC").page(params[:page]).per(4)
    @app_name     = BetaInviteConfig.app_name
  end
  
  def new
		@beta_invite = BetaInvite::BetaInvite.new
	end

  # save the email and send an email.
  # Redirect to the path the app developer has mentioned in application_controller. This would be
  # checked in the fucntion called 'check_for_redirects'
	def create
  	@beta_invite = BetaInvite::BetaInvite.new(params[:beta_invite])
      @redirect = false
      if @beta_invite.save
      flash[:alert] = nil
      flash[:notice] = t('beta_invite.messages.thank_you')
      send_beta_invite_email
      check_for_redirects
    else
      flash[:notice] = nil
      flash[:alert] = t('beta_invite.messages.sorry')
      respond_with(@beta_invite)
  	end
  end  
  
  private

  # check redirects mentioned by the app owner if any.
  def check_for_redirects
    if @path = after_beta_invite_request_path
      @redirect = true
      respond_with(@beta_invite)
    else
      respond_with(@beta_invite)
    end
  end

  # overwrite this method in the application controller of the app
  # and provide a path to be redirected to.
  # This method here would check if check if its be over written in the app.
  def after_beta_invite_request_path
    super if defined?(super)
  end
  
  # send mail to app admin about a request being registered.
  def send_beta_invite_email
    begin
      total_count = BetaInvite::BetaInvite.count
      BetaInvite::SignUpMailer.delay.beta_invites_requested( @beta_invite , total_count )
    rescue Exception => e
      Rails.logger.error ("Unable to send Beta Invite Mail")
    end
	end

  def send_notification_mail_to_user
    # begin
      BetaInvite::SignUpMailer.delay.notification_mail_to_user( @beta_invite )
    # rescue Exception => e
      # Rails.logger.error ("Unable to mail the notification mail to user")
    # end
  end

  protected

  # http basic auth to view beta_invites page.
  # The user name and the password is mentioned in the beta_invite.yml file
  # The developer can modify the user name and password as needed.
  # Default :: username = admin
  #            password = admin
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
       username == BetaInviteConfig.username && password == BetaInviteConfig.password
    end
  end
end
