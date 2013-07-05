# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)      not null
#  date        :string(255)
#  time        :string(255)
#  venue       :string(255)
#  joining     :string(255)
#  contact     :string(255)
#  cost        :string(255)
#  access      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :name, :description, :date, :time, :venue, :joining, :contact, :cost, :access, :address_id, :address_attributes
  belongs_to :address
  accepts_nested_attributes_for :address
  validates :name, :presence => true
  validates :description,  :presence => true

  def summary_address
  	"#{address.number} #{address.street}, #{address.town}, "
  end

  def address_line_one
  	"#{address.number} #{address.street}"
  end
  
  def address_town
  	"#{address.town}"
  end

  def address_district
  	"#{address.district}"
  end

  def address_county
  	"#{address.county}"
  end

  def address_postcode
  	"#{address.postcode}"
  end
    
end
