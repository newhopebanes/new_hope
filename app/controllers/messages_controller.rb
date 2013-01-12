class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.query_mail(@message).deliver
      flash[:notice] = "Message sent! Thank you for contacting us."
      render :action => 'new'
    else
      render :action => 'new'
    end
  end
end
