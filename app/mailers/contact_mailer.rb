class ContactMailer < ActionMailer::Base
  default from: "newhope.webapp@gmail.com"
  
  def send_mail
    mail(:to => "turners8n@hotmail.com", :subject => "Test Email")
  end
end
