class Tagset < ActiveRecord::Base
  attr_accessible :sports, :outdoors, :creative, :wellbeing, :social, :faith, :food, :learning, :exersise, :lifestyle, :other
  belongs_to :event
end
