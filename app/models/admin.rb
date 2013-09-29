class Admin < ActiveRecord::Base
  attr_accessible :hope, :bridges
  attr_accessible :BridgesEmail, :NewHopeEmail, :internal_contacts_attributes
  has_many :internal_contacts
  accepts_nested_attributes_for :internal_contacts


  def contacts
  	self.internal_contacts
  end

end



