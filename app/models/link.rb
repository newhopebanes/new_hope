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

  def self.young_people
	all.keep_if do |l|
      l.link_type.position  == 4
    end
  end

  def self.adults
  all.keep_if do |l|
      l.link_type.position  == 5
    end
  end

  def self.older_people
  all.keep_if do |l|
      l.link_type.position  == 6
    end
  end

  def self.family
  all.keep_if do |l|
      l.link_type.position  == 7
    end
  end

  def self.housing
  all.keep_if do |l|
      l.link_type.position  == 8
    end
  end

  def self.financial_legal
  all.keep_if do |l|
      l.link_type.position  == 9
    end
  end

  def self.other
  all.keep_if do |l|
      l.link_type.position  == 10
    end
  end

end


