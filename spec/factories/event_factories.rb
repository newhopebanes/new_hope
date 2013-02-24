FactoryGirl.define do
  factory :event do
    name         "Test event name"
    organisation "Test Organisation"
    cost         "Free"
    access       "1" 
    referral_id  "1"
  end
end
