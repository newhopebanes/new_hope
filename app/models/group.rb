class Group < ActiveRecord::Base
  attr_accessible :name, :description, :date, :time, :venue, :joining, :contact, :cost, :access
  validates :name, :presence => true
  validates :description,  :presence => true
    
end
