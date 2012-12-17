# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  organisation       :string(255)      not null
#  description        :string(255)
#  contact_person     :string(255)
#  contact_role       :string(255)
#  phone              :string(255)
#  email              :string(255)
#  address            :string(255)
#  website            :string(255)
#  contact_id         :integer
#  date               :date
#  time               :time
#  ongoing            :boolean
#  frequency_id       :integer
#  day_id             :integer
#  cost               :string(255)      not null
#  access             :boolean          not null
#  access_details     :string(255)
#  referral_id        :integer
#  joining_process    :string(255)
#  directions_car     :string(255)
#  directions_walking :string(255)
#  directions_bus     :string(255)
#  directions_train   :string(255)
#  other              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#



class Event < ActiveRecord::Base
  attr_accessible :name, :organisation, :description, :contact_person, :contact_role, :phone, :email, :address_id,
                  :website,:contact_id, :cost, :access, :access_details, :complex_date_id,
                  :referral_id, :joining_process, :directions_car, :directions_walking, :directions_bus, :directions_train,
                  :other, :tagset_attributes, :targetset_attributes, :address_attributes, :complex_date_attributes
  belongs_to :referral
  belongs_to :contact
  has_one :address
  has_one :complex_date
  has_one :tagset
  has_one :targetset
  accepts_nested_attributes_for :tagset, :targetset, :address, :complex_date
  
  validates :name, :presence => true
  validates :organisation,  :presence => true
  validates :cost, :presence => true
  validates :access,  :presence => true
  validates :referral_id, :presence => true
  
  scope :for_tag, lambda{|tag| joins(:tagset).where(tag + ' = ?',  true)}
  scope :for_target, lambda{|target| joins(:targetset).where(target + ' = ?',  true)}
  
  
  def display_address
    result = "#{address.number}, #{address.street}, #{address.postcode}"
    if result.length > 5
      result
    else
      'Unknown'
    end
    

  end
  

  
end
