class MessagesController < ApplicationController
  def new
    @message = Message.new
    @hope = Admin.first.internal_contacts.find(1)
    @bridges = Admin.first.internal_contacts.find(2)
  end

  def create
    @message = Message.new(params[:message])
    @hope = Admin.first.internal_contacts.find(1)
    @bridges = Admin.first.internal_contacts.find(2)
    if @message.valid?
      @message.send_email
      flash[:notice] = "Message sent! Thank you for contacting us."
      render :action => 'new'
    else
      render :action => "new"
    end
  end
end
