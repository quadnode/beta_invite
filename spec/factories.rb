FactoryGirl.define do
	factory :beta_invite do 
  	sequence(:email) {|n| "foo#{n}@example.com"}
  end
end