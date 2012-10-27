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
  attr_accessible :name, :description, :date, :time, :venue, :joining, :contact, :cost, :access
  validates :name, :presence => true
  validates :description,  :presence => true
    
end
