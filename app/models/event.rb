# == Schema Information
#
# Table name: events
#
#  id                           :integer          not null, primary key
#  name                         :string(255)      not null
#  organisation                 :string(255)      not null
#  description                  :string(255)
#  contact_person               :string(255)
#  contact_role                 :string(255)
#  phone                        :string(255)
#  email                        :string(255)
#  address                      :string(255)
#  website                      :string(255)
#  contact_id                   :integer
#  date                         :date
#  time                         :time
#  ongoing                      :boolean
#  frequency_id                 :integer
#  day_id                       :integer
#  cost                         :string(255)      not null
#  access                       :boolean          not null
#  access_details               :string(255)
#  referral_id                  :integer          not null
#  joining_process              :string(255)
#  adults                       :boolean
#  under_18                     :boolean
#  target_men                   :boolean
#  target_women                 :boolean
#  target_mental_health         :boolean
#  target_learning_difficulties :boolean
#  target_drug_alcohol          :boolean
#  target_homelessness          :boolean
#  target_carers                :boolean
#  target_carers_mental_health  :boolean
#  target_vulnerable            :boolean
#  target_anyone                :boolean
#  target_other                 :string(255)
#  tag_arts                     :boolean
#  tag_sports                   :boolean
#  tag_outdoors                 :boolean
#  tag_creative                 :boolean
#  tag_wellbeing                :boolean
#  tag_social                   :boolean
#  tag_faith                    :boolean
#  tag_food                     :boolean
#  tag_learning                 :boolean
#  tag_exersise                 :boolean
#  tag_lifestyle                :boolean
#  tag_other                    :string(255)
#  directions_car               :string(255)
#  directions_walking           :string(255)
#  directions_bus               :string(255)
#  directions_train             :string(255)
#  other                        :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

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
