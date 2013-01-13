require 'spec_helper'
require_relative File.expand_path('../../../../app/models/message.rb', __FILE__)

describe Message do
  
  before do
    @message = Message.new(name: "John Doe", new_hope: false, bridges: false,
      phone: "0123456789", email: "john@doe.com", confirmation: false, 
      subject: "Test Subject", content: "Test Content")
  end

  subject {@message}

  it  {should respond_to{:name}}
  it  {should respond_to{:new_hope}}

end