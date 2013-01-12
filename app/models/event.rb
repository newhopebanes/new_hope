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
  #scope :this_week, self.where(self.this_week?)}
  
  
  
  def display_address
    result = "#{address.number}, #{address.street}, #{address.postcode}"
    if result.length > 5
      result
    else
      'Unknown'
    end
   

  end
  
  def this_week?
    today = Date.today
    start_of_week = Date.new(today.year, today.month, ( today.day - ( today.wday - 1 )))
    end_of_week = Date.new(today.year, today.month, ( today.day - ( 7 - today.wday )))
    puts "Today: #{today}"
    puts "start_of_week: #{start_of_week}"
    puts "end_of_week: #{end_of_week}"
    puts "complex_date.fixed_date: #{complex_date.fixed_date}"
    complex_date.fixed_date >  start_of_week and complex_date.fixed_date < end_of_week
  end
  
  def this_month?
    today = Date.today
    complex_date.fixed_date.month == today.month
  end
  
  def today?
    today = Date.today
    complex_date.fixed_date == today
  end

  
end
