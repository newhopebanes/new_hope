class Event < ActiveRecord::Base
  attr_accessible :name, :organisation, :description, :contact_person, :contact_role, :phone, :email, :address, :contact_id, :date, :time, :ongoing, :frequency_id, :day_id, :cost, :access, :access_details, :referral_id, :joining_process, :target_id, :tag_id, :directions_walking, :directions_bus, :directions_train, :directions_car, :other
  belongs_to :tag
  belongs_to :target
  belongs_to :day
  belongs_to :frequency
  belongs_to :referral
  belongs_to :contact
  
  validates :name, :presence => true
  validates :organisation,  :presence => true
  validates :cost, :presence => true
  validates :access,  :presence => true
  validates :referral_id, :presence => true
  validates :target_id,  :presence => true

end
