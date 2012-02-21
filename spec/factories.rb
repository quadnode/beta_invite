FactoryGirl.define :beta_invite do |f|
  f.sequence(:email) {|n| "foo#{n}@example.com"}
end