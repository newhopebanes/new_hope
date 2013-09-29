# == Schema Information
#
# Table name: referrals
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Referral < ActiveRecord::Base
  attr_accessible :position, :title
end
