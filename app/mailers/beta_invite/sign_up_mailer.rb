module BetaInvite
  class SignUpMailer < ActionMailer::Base
    # the to_email and from_email are configured in the beta_invite.yml in 
    # developer app's config folder.
    
    def beta_invites_requested( beta_invite , total_count )
      @beta_invite  = beta_invite
      @total_count  = total_count
      subject  = t('beta_invite.mails.subject' , :email => @beta_invite.recipient_email , :app_name => BetaInviteConfig.app_name)
      send_mail(subject , BetaInviteConfig.to_email , BetaInviteConfig.from_email )
    end  

    def notification_mail_to_user( beta_invite )
      @beta_invite = beta_invite
      subject = "We will notify you shortly."
      send_mail( subject , @beta_invite.recipient_email , BetaInviteConfig.from_email )
    end

    def send_mail( subject , to_email , from_email )
      mail(
        :to       =>  to_email,
        :subject  =>  subject,
        :from     =>  from_email
      )
    end
  end
end