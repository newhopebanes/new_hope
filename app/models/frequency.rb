# == Schema Information
#
# Table name: frequencies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Frequency < ActiveRecord::Base
  attr_accessible :position, :title
end
