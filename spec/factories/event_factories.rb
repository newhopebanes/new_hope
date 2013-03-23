FactoryGirl.define do

  factory :event do
    name         "Test event name"
    organisation "Test Organisation"
    cost         "Free"
    access       "1" 
    referral
  end

  factory :populated_event, :class => Event do
    name         "Test event name"
    organisation "Test Organisation"
    cost         "Free"
    access       "1" 
    referral
    complex_date
    
    trait :all_tags do
    tagset
    end

    trait :no_sports_tags do
    association :tagset, :factory => :tagset, :sports => "0"
    end

    trait :all_targets do
    targetset
    end

    trait :no_women_targets do
    association :targetset, :factory => :targetset, :women => "0"
    end

  end

  factory :self_event, :class => Event do
    name         "Self event name"
    organisation "Test Organisation"
    cost         "Free"
    access       "1" 
    association :referral, :factory => :referral_self
  end


  factory :referral do
    position  "1"
    title     "GP/Proffessional Referral"
  end

  factory :referral_self, :class => Referral do
    position  "2"
    title     "Self Referral"
  end

  factory :tagset do
    arts        "1"   
    sports      "1"
    outdoors    "1"
    creative    "1"
    wellbeing   "1"
    social      "1"
    faith       "1"
    food        "1"
    learning    "1"
    exercise    "1"
    lifestyle   "1"
    other       "1"
  end

  factory :targetset do
    adults                "1"
    under_18              "1"
    men                   "1"
    women                 "1"
    mental_health         "1"
    learning_difficulties "1"
    drug_alcohol          "1"
    homelessness          "1"
    carers                "1"
    carers_mental_health  "1"
    vulnerable            "1"
    anyone                "1"
    other                 "1"
  end

  factory :complex_date do
    event_id           "1"
    fixed_date         Date.today
    time               Time.now
    date_type
    offset_type
    fixed_offset
    dynamic_offset
    frequency
    fixed_frequency
    day
  end

  factory :date_type do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :offset_type do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :fixed_offset do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :dynamic_offset do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :frequency do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :fixed_frequency do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

  factory :day do
    position  "1"
    title     "NOT IMPORTANT FOR NOW"
  end

 
end
