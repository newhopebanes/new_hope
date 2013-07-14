class Group < ActiveRecord::Base
  attr_accessible :name, :description, :date, :time, :venue, :joining, :contact, :cost, :access, :address_id, :address_attributes, :image_one
  has_attached_file :image_one,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  belongs_to :address
  accepts_nested_attributes_for :address
  validates :name, :presence => true
  validates :description,  :presence => true

  def has_image
    image_one.exists?
  end

  def summary_address
  	"#{address.number} #{address.street}, #{address.town}, "
  end

  def address_line_one
  	"#{address.number} #{address.street}"
  end

  def address_town
  	"#{address.town}"
  end

  def address_district
  	"#{address.district}"
  end

  def address_county
  	"#{address.county}"
  end

  def address_postcode
  	"#{address.postcode}"
  end

end
