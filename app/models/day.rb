# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Day < ActiveRecord::Base
  attr_accessible :position, :title
end
