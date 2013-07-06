class Link < ActiveRecord::Base
  @@result
  attr_accessible :link_type_id, :location, :name, :opening, :phone, :text, :url
  belongs_to :link_type

  
  def self.emergency
	all.keep_if do |l|
      l.link_type.position  == 1
    end
  end

  def self.non_emergency
	all.keep_if do |l|
      l.link_type.position  == 2
    end
  end

  def self.specific
	all.keep_if do |l|
      l.link_type.position  == 3
    end
  end

  def self.social_other
	all.keep_if do |l|
      l.link_type.position  == 4
    end
  end
end


