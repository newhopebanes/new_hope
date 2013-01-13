require 'gmail_sender'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  USER_NAME = 'newhope.webapp@gmail.com'
  PASSWORD = 'newhopepassword' 
  
  NEW_HOPE = 'newhope.reciever@gmail.com'
  BRIDGES = 'building_briges@email.com'

  attr_accessor :name, :new_hope, :bridges, :phone, :email, :confirmation, :subject, :content
  validates_presence_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_length_of :content, :maximum => 500
  
  


  @to
  #Build an address array based on bool flags
  def to
    @to = Array.new
    if new_hope
      @to << NEW_HOPE
    end
    if bridges
      @to << BRIDGES
    end
    if confirmation
      @to << @email
    end
    @to
  end
  
  def persisted?
    false
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  #Generate the full message that will be sent
  def full_content
     result = <<END
     Message from: #{@name}

     Phone: #{@phone}
     Email: #{@email}
     %=====================================%

     #{self.content}
END
  result
  end

  #Use gmail_sender to send the email
  def send_email
     g = GmailSender.new(USER_NAME, PASSWORD)

    g.send(:to => to,
           :subject => @subject,
           :content => full_content)
  end



end