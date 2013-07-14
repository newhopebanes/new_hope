require 'event_display_helper'
require 'event_date_helper'
require 'events_refinement_helper'

class Event < ActiveRecord::Base

  include EventDisplayHelper
  include EventDateHelper
  extend EventsRefinementHelper

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

end
