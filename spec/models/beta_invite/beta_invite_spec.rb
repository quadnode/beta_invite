require 'spec_helper' 
require 'beta_invite'
describe BetaInvite do
  describe ".email" do
    it "should give error for no recipient_email" do
      pending "troouble with the model access"
      beta_invite = BetaInvite::BetaInvite.new
      beta_invite.save.should_not be_valid
      beta_invite.errors.on(:recipient_email).should == "is required"
    end
    
    it "should give error for invalid recipient_email" do
      pending "trouble with the model access"
      beta_invite = BetaInvite.create(:recipient_email => 'invalidemail')
      beta_invite.save.should_not be_valid
      beta_invite.errors.on(:recipient_email).should == "is required"
    end
    
    it "should give success message for valid recipient_email" do
      pending "trouble with the model access"
      beta_invite = BetaInvite.create(:recipient_email => 'valid@email.coml')
      beta_invite.save.should be_valid
      beta_invite.errors.on(:recipient_email).should == "is required"
    end
    
    it "should give error message for recipient_email already registered" do
      pending "trouble with the model access"
      BetaInvite.create(:recipient_email => 'valid@email.com')
      beta_invite = BetaInvite.create(:recipient_email => 'valid@email.com')
      beta_invite.save.should_not be_valid
      beta_invite.errors.on(:recipient_email).should == "is required"
    end
  end
end