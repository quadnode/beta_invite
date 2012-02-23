require 'spec_helper'

describe BetaInviteController do
  
  it "should create beta_invite" do
    post "create_beta_invite", :beta_invite[:recipient_email] => "test@test.com"
    response.body.should include("Thank You")
  end
  

end