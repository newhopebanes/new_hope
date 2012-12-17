# == Schema Information
#
# Table name: tagsets
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  arts       :boolean
#  sports     :boolean
#  outdoors   :boolean
#  creative   :boolean
#  wellbeing  :boolean
#  social     :boolean
#  faith      :boolean
#  food       :boolean
#  learning   :boolean
#  exercise   :boolean
#  lifestyle  :boolean
#  other      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagset < ActiveRecord::Base
  attr_accessible :sports, :outdoors, :creative, :wellbeing, :social, :faith, :food, :learning, :exercise, :lifestyle, :other
  belongs_to :event  
end
