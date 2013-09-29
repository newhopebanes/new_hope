# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  organisation       :string(255)      not null
#  description        :string(255)
#  contact_person     :string(255)
#  contact_role       :string(255)
#  phone              :string(255)
#  email              :string(255)
#  address            :string(255)
#  website            :string(255)
#  contact_id         :integer
#  date               :date
#  time               :time
#  ongoing            :boolean
#  frequency_id       :integer
#  day_id             :integer
#  cost               :string(255)      not null
#  access             :boolean          not null
#  access_details     :string(255)
#  referral_id        :integer
#  joining_process    :string(255)
#  directions_car     :string(255)
#  directions_walking :string(255)
#  directions_bus     :string(255)
#  directions_train   :string(255)
#  other              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
