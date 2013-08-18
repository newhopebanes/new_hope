require 'gmail_sender'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  USER_NAME = 'newhope.webapp@gmail.com'
  PASSWORD = 'newhopepassword'
  CHECKED = "1"

  NEW_HOPE = Admin.first.NewHopeEmail #'newhope.reciever@gmail.com'
  BRIDGES = Admin.first.BridgesEmail  #'bridges.reciever@gmail.com'

  # NEW_HOPE = 'turners8n@hotmail.com'
  # BRIDGES = 'turners8n@hotmail.com'

  attr_accessor :name, :new_hope, :bridges, :phone, :email, :confirmation, :subject, :content
  validates_presence_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :if => :validate_email?
  validate :has_outgoing_email


  @to
  #Build an address array based on bool flags
  def to
    @to = Array.new
    if new_hope == CHECKED
      @to << NEW_HOPE
    end
    if bridges == CHECKED
      @to << BRIDGES
    end
    if confirmation == CHECKED
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

  private

    def has_outgoing_email
      unless new_hope == CHECKED or bridges == CHECKED
        errors.add(:base, "You must set at least one outgoing email address")
      end
      return true
    end

    def validate_email?
      if confirmation == CHECKED
        return true
      end
      email != nil and email != ''
    end



end