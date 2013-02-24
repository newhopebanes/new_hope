require 'spec_helper'

require_relative File.expand_path('../../../../app/models/event.rb', __FILE__)

describe 'Event' do

  before do
    @event = FactoryGirl.create(:event)
  end

  it "has a valid factory" do
    @event.should be_valid
  end

  it 'is not valid without a name' do
     @event.name = nil
     @event.should_not be_valid
  end

  it 'is not valid without a organisation' do
     @event.organisation = nil
     @event.should_not be_valid
  end

  it 'is not valid without a cost' do
     @event.cost = nil
     @event.should_not be_valid
  end

  it 'is not valid without a access' do
     @event.access = nil
     @event.should_not be_valid
  end

  it 'is not valid without a referral' do
     @event.referral_id = nil
     @event.should_not be_valid
  end


end
