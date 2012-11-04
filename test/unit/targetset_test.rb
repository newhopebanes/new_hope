# == Schema Information
#
# Table name: targetsets
#
#  id                    :integer          not null, primary key
#  event_id              :integer
#  adults                :boolean
#  under_18              :boolean
#  men                   :boolean
#  women                 :boolean
#  mental_health         :boolean
#  learning_difficulties :boolean
#  drug_alcohol          :boolean
#  homelessness          :boolean
#  carers                :boolean
#  carers_mental_health  :boolean
#  vulnerable            :boolean
#  anyone                :boolean
#  other                 :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class TargetsetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
