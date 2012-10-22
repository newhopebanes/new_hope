class Event < ActiveRecord::Base
  attr_accessible :name, :organisation, :description, :contact_person, :contact_role, :phone, :email, :address, :website, :contact_id, :date, :time, :ongoing, :frequency_id, :day_id, :cost, :access, :access_details, :referral_id, :joining_process, :adults, :under_18, :target_men, :target_women, :target_mental_health, :target_learning_difficulties, :target_drug_alcohol, :target_homelessness, :target_carers, :target_carers_mental_health, :target_vulnerable, :target_anyone,  :target_other, :tag_arts, :tag_sports, :tag_outdoors, :tag_creative , :tag_wellbeing, :tag_social, :tag_faith, :tag_food, :tag_learning, :tag_exersise, :tag_lifestyle,  :tag_other, :directions_car, :directions_walking, :directions_bus, :directions_train, :other
  belongs_to :day
  belongs_to :frequency
  belongs_to :referral
  belongs_to :contact
  
    validates :name, :presence => true
    validates :organisation,  :presence => true
    validates :cost, :presence => true
    validates :access,  :presence => true
    validates :referral_id, :presence => true
end
