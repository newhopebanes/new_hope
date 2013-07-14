class Update < ActiveRecord::Base
  attr_accessible :action, :area, :description, :user

  def display_date
  	updated_at.in_time_zone.strftime("Last updated: %e %b %Y %H:%M%p")
  end
end
