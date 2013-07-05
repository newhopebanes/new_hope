module EventDisplayHelper

  def summary_date
    complex_date.fixed_date == nil ? 'Unknown' : complex_date.fixed_date.strftime("%b %e")
  end

  def summary_time
    complex_date.time == nil ? '' : complex_date.time.strftime("%l:%M %p")
   end

  def summary_name
    name == '' ? 'Unknown' : name
   end
  
  
  def summary_address
    result = "#{address.number}, #{address.street}, #{address.postcode}"
    if result.length > 5
      result
    else
      'Unknown'
    end
  end

  def summary_address_line_one
    "#{address.number}, #{address.street}"
  end

  def summary_address_postcode
    "#{address.postcode}"
  end

  def summary_cost
    cost  == '' ? 'Unknown' : cost
  end

  def summary_contact
    contact_person  == '' ? 'Unknown' : contact_person
  end

  def display_access
    access ? "Full disabled access" : "No disabled access"
  end
  
  def display_contact
     "#{phone}" if contact_id == 2
     "#{email}"
  end

  def display_organisiation
    organisation  == '' ? '' : organisation
  end

  def display_description
    description == '' ? 'Unknown' : description
  end

  def display_directions_car?
    directions_car.length > 0
  end

  def display_directions_car
    directions_car
  end

  def display_directions_walking?
    directions_walking.length > 0
  end

  def display_directions_walking
    directions_walking
  end

  def display_directions_bus?
    directions_bus.length > 0
  end

  def display_directions_bus
    directions_bus
  end

  def display_directions_train?
    directions_train.length > 0
  end

  def display_directions_train
    directions_train
  end

end