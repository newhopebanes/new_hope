class StaticPagesController < ApplicationController
  def about
  end

  def links
  end

  def contact
  end
  
  def send_mail
    contact_mailer.send_mail
  end
  
  def home
    
  end
end
