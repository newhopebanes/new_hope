class Event < ActiveRecord::Base
  @@result
  @@params
  @@search_critera
  attr_accessible :name, :organisation, :description, :contact_person, :contact_role, :phone, :email, :address_id,
                  :website,:contact_id, :cost, :access, :access_details, :complex_date_id,
                  :referral_id, :joining_process, :directions_car, :directions_walking, :directions_bus, :directions_train,
                  :other, :tagset_attributes, :targetset_attributes, :address_attributes, :complex_date_attributes
  belongs_to :referral
  belongs_to :contact
  has_one :address
  has_one :complex_date
  has_one :tagset
  has_one :targetset
  accepts_nested_attributes_for :tagset, :targetset, :address, :complex_date
  
  validates :name, :presence => true
  validates :organisation,  :presence => true
  validates :cost, :presence => true
  validates :access,  :presence => true
  validates :referral_id, :presence => true
  
  scope :for_tag, lambda{|tag| joins(:tagset).where(tag + ' = ?',  true)}
  scope :for_target, lambda{|target| joins(:targetset).where(target + ' = ?',  true)}

#============================================================================
#  CLASS METHODS
#============================================================================
  public
  # Refine and return a list of events
  def self.get_events params
    
    return all unless params
    
    @@result = all
    @@params = params
    @@search_critera = Search.new

    if @@search_critera.taglist.include?(@@params[:tag])
      refine_tags
    end

    if @@search_critera.targetlist.include?(@@params[:target])
      refine_target
    end

    if @@search_critera.referrallist.include?(@@params[:referral])
      refine_referral
    end

    @@result
  end

  private

    def self.refine_tags
      @@result.keep_if do |e|
        e.tagset[@@params[:tag]] == true
      end
    end

    def self.refine_target
      @@result.keep_if do |e|
        e.targetset[@@params[:target]] == true
      end
    end

    def self.refine_referral
      index = @@search_critera.referrallist.index(@@params[:referral]) + 1
      @@result.keep_if do |e|
        e.referral.position == index
      end
    end


#============================================================================
#  INSTANCE METHODS
#============================================================================

  public
  # Methods for dealing with dates
  def this_week?
    complex_date.this_week?
  end
  
  def this_month?
    complex_date.this_month?
  end
  
  def today?
    complex_date.today?
  end

   
#============================================================================
#  DISPLAY METHODS
#============================================================================
  public
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

  def display_directions

     
  end

  def display_organisiation
    organisation  == '' ? '' : organisation
  end

  def display_description
    description == '' ? 'Unknown' : description
  end

end
