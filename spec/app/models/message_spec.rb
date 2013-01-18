require 'spec_helper'
require_relative File.expand_path('../../../../app/models/message.rb', __FILE__)

describe 'Message' do
  
  before do
    @message = Message.new(name: "John Doe", new_hope: false, bridges: false,
      phone: "0123456789", email: "john@doe.com", confirmation: false, 
      subject: "Test Subject", content: "Test Content")
  end

  it 'has a name' do
    expect(@message.name).to eq 'John Doe'
  end

  it 'needs a name to be valid' do
    @message.name = nil
    expect(@message.valid?).to eq false
  end

  it 'has a phone number' do
    expect(@message.phone).to eq '0123456789'
  end

  it 'has an email address' do
    expect(@message.email).to eq 'john@doe.com'
  end

  it 'needs a correctly formatted email to be valid' do
    @message.email = "@.com.incorrect"
    expect(@message.valid?).to eq false
  end

  it 'has a subject' do
    expect(@message.subject).to eq 'Test Subject'
  end

  it 'has a content field' do
    expect(@message.content).to eq 'Test Content'
  end

  it 'adds new hopw email address if new_hope is true' do
    @message.new_hope = true
    expect(@message.to.first).to eq "newhope.reciever@gmail.com"
  end

  it 'adds bridges email address if bridges is true' do
    @message.bridges = true
    expect(@message.to.first).to eq "building_briges@email.com"
  end

  it 'adds user email address if confirmation is true' do
    @message.confirmation = true
    expect(@message.to.first).to eq @message.email
  end

  it 'can send mail to multiple addresses' do
    @message.new_hope = true
    @message.confirmation = true
    expect(@message.to.length).to eq 2
  end

  it 'must have one outgoing email address to be valid' do
    @message.new_hope = false
    @message.bridges = false
    expect(@message.valid?).to eq false
  end

  it 'includes the @name in the email message' do
    expect(@message.full_content).to include "#{@message.name}"
  end

  it 'includes the @phone in the email message' do
    expect(@message.full_content).to include "#{@message.phone}"
  end

  it 'includes the @email in the email message' do
    expect(@message.full_content).to include "#{@message.email}"
  end

  it 'includes the @content in the email message' do
    expect(@message.full_content).to include "#{@message.content}"
  end

end