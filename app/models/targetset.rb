class Targetset < ActiveRecord::Base
   attr_accessible :adults, :under_18, :men, :women, :mental_health, :learning_difficulties, :drug_alcohol, :homelessness, :carers, :carers_mental_health, :vulnerable, :anyone, :other
   belongs_to :event
end
