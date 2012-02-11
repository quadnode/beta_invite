module BetaInvite
  class SignUpMailer < ActionMailer::Base
  
    def beta_invites_requested(beta_invite , total_count)
      @beta_invite  = beta_invite
      @total_count  = total_count
      subject  = t('mails.beta_invites.subject' , :email => @beta_invite.recipient_email)
      send_mails_for_both_functions(subject)
    end  
  
    def user_sign_up(user_info , users_count)
      @user = user_info
      @users_count = users_count
      subject  = t('mails.sign_up.subject', :name => @user.name)    
      send_mails_for_both_functions
    end
  
    def send_mails_for_both_functions(subject)
      from_email  = Rails.application.config.support_mails[:from_email]
      to_email    = Rails.application.config.support_mails[:to_email]
      mail(
        :to       =>  to_email,
        :subject  =>  subject,
        :from     =>  from_email
      )
    end
  end
end
