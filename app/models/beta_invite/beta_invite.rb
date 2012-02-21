module BetaInvite
  class BetaInvite < ActiveRecord::Base
    EMAIL_R=/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 	
    validates :recipient_email, :presence => true, :format=>EMAIL_R	 
    validate :recipient_is_not_registered
 	
    def column_names_for_su_interface
      [:id,:recipient_email, :created_at]
    end
 	
    private

    def recipient_is_not_registered
      if BetaInvite.find_by_recipient_email(recipient_email)
        errors.add( :recipient_email, 'is already registered with us for the private Beta') 
        #errors.add( :recipient_email, 'Your email is already registered with us for the private beta') 
      end
    end
	
  end
end