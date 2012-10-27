# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  has_secure_password
  before_save { |user| user.name = name.downcase }
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
