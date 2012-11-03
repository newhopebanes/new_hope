class Tagset < ActiveRecord::Base
  attr_accessible :sports, :outdoors, :creative, :wellbeing, :social, :faith, :food, :learning, :exercise, :lifestyle, :other
  belongs_to :event
end
