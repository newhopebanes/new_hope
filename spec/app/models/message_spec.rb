require 'spec_helper'
require_relative File.expand_path('../../../../app/models/message.rb', __FILE__)

CHECKED = "1"
UNCHECKED = "0"

describe 'Message' do
  
  before do
    @message = Message.new(name: "John Doe", new_hope: CHECKED, bridges: 0,
      phone: "0123456789", email: "john@doe.com", confirmation: UNCHECKED, 
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

  it 'email address allowed to be empty' do
    @message.email = ''
    expect(@message.valid?).to eq true
  end

  it 'email address must be entered if confirmation is true' do
    @message.email = "dsjdsakdjsal"
    @message.confirmation = CHECKED
    expect(@message.valid?).to eq false
    expect(@message.errors.messages[:email].first).to eq "is invalid"
  end

  it 'needs a correctly formatted email if it is supplied' do
    @message.email = "@.com.incorrect"
    expect(@message.valid?).to eq false
  end

  it 'has a subject' do
    expect(@message.subject).to eq 'Test Subject'
  end

  it 'has a content field' do
    expect(@message.content).to eq 'Test Content'
  end

  it 'adds new hope email address if new_hope is true' do
    @message.new_hope = CHECKED
    @message.bridges = UNCHECKED
    expect(@message.to.first).to eq "newhope.reciever@gmail.com"
  end

  it 'adds bridges email address if bridges is true' do
    @message.new_hope = UNCHECKED
    @message.bridges = CHECKED
    expect(@message.to.first).to eq "building_briges@email.com"
  end

  it 'adds user email address if confirmation is true' do
    @message.new_hope = UNCHECKED
    @message.bridges = UNCHECKED
    @message.confirmation = CHECKED
    expect(@message.to.first).to eq @message.email
  end

  it 'can send mail to multiple addresses' do
    @message.new_hope = CHECKED
    @message.confirmation = CHECKED
    expect(@message.to.length).to eq 2
  end

  it 'must have one outgoing email address to be valid' do
    @message.new_hope = UNCHECKED
    @message.bridges = UNCHECKED
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