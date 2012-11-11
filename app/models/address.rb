class Address < ActiveRecord::Base
  attr_accessible :county, :district, :number, :postcode, :street, :town
end
