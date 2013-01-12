class ContactMailer < ActionMailer::Base
  default from: "newhope.webapp@gmail.com"
  
  def query_mail(message)
    @message = message
    mail(:to => "turners8n@hotmail.com", :subject => @message.subject)
  end
end
