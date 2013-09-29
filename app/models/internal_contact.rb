class InternalContact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :admin_id
end
