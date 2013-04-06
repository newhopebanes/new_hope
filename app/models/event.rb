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

    if @@search_critera.cost.include?(@@params[:cost])
      refine_cost
    end    

    if @@search_critera.taglist.include?(@@params[:tag])
      refine_tags
    end

    if @@search_critera.targetlist.include?(@@params[:target])
      refine_target
    end

    if @@search_critera.referrallist.include?(@@params[:referral])
      refine_referral
    end

    if @@search_critera.quick_date.include?(@@params[:quick_date])
      refine_quickdate
    end

    if @@params.include?(:date) and @@params[:date].length == 10 
      refine_date
    end

    @@result
  end

  private

    def self.refine_cost
      # MONEY_REGEX = /(\d+)\.*(\d*)/

      @@result.keep_if do |e|
        puts e.cost
        puts @@params[:cost]

        if e.cost.downcase.strip == 'free'
          true
        

        elsif @@params[:cost] == 'less'
          result = /(\d+)\.*(\d*)/.match(e.cost)
          true if result and result[1].to_i <= 5
        

        elsif @@params[:cost] == 'more'
          result = /(\d+)\.*(\d*)/.match(e.cost)
          true if result and result[1].to_i >= 5
        end

      end
      
    end  

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

    def self.refine_date
      @@result.keep_if do |e|
        e.complex_date.fixed_date == Date.parse(@@params[:date])
      end
    end

    def self.create_date_from_params
      r = @@params[:date].split(/((\d+)[\/](\d+)[\/](\d+))/)
      Date.parse("#{r[4]}-#{r[2]}-#{r[3]}")
    end

    def self.refine_quickdate
      search = @@params[:quick_date]

      if search == 'day'
        @@result.keep_if do |e|
          e.today?
        end
      end

      if search == 'week'
        @@result.keep_if do |e|
          e.this_week?
        end
      end

      if search == 'month'
        @@result.keep_if do |e|
          e.this_month?
        end
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
