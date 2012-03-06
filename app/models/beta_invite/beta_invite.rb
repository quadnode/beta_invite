module BetaInvite
  class BetaInvite < ActiveRecord::Base
    EMAIL_R=/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 	
    validates :recipient_email, :presence => true, :format=>EMAIL_R	 
    validate :recipient_is_not_registered
 	
    private

    def recipient_is_not_registered
     if BetaInvite.find_by_recipient_email(recipient_email)
       errors.add( :recipient_email, 'is already registered with us for private Beta') 
     end
   end
  end
end
