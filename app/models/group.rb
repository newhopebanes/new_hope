class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :name, :presence => true
  validates :description,  :presence => true
    
end
