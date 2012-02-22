module BetaInvite
  class SignUpMailer < ActionMailer::Base
    def beta_invites_requested(beta_invite , total_count)
      @beta_invite  = beta_invite
      @total_count  = total_count
      subject  = t('beta_invite.mails.subject' , :email => @beta_invite.recipient_email)
      send_mail(subject)
    end  

    def send_mail(subject)
      mail(
        :to       =>  BetaInviteConfig.to_email,
        :subject  =>  subject,
        :from     =>  BetaInviteConfig.from_email
      )
    end
  end
end