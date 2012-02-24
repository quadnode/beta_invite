module BetaInvite
  class SignUpMailer < ActionMailer::Base
    def beta_invites_requested(beta_invite , total_count)
      @beta_invite  = beta_invite
      @total_count  = total_count
      subject  = t('beta_invite.mails.subject' , :email => @beta_invite.recipient_email , :app_name => BetaInviteConfig.app_name)
      send_mail(subject)
    end  

    # the to_email and from_email are configured in the beta_invite.yml in 
    # developer app's config folder.
    def send_mail(subject)
      mail(
        :to       =>  BetaInviteConfig.to_email,
        :subject  =>  subject,
        :from     =>  BetaInviteConfig.from_email
      )
    end
  end
end