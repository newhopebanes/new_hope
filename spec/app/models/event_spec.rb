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

  describe 'date' do

    before do
    @event = FactoryGirl.create(:populated_event)
  end

    it 'knows whether the event is today' do
      @event.today?.should be true
    end

    it 'knows whether the event is this week' do
      @event.this_week?.should be true
    end

    it 'knows whether the event is this month' do
      @event.this_month?.should be true
    end

  end


end



describe 'Events' do

  before do
    @params = {}
    @events = Array.new
    2.times do
    @events << FactoryGirl.create(:populated_event, :all_tags, :all_targets)
    # @events.each{ |e| puts e.complex_date.month}
    end

  end

  it 'returns a list of events' do
    result = Event.get_events(@params)
    result.length.should eq(2)
  end

  it 'filters list on Referral Type' do

    @events << FactoryGirl.create(:self_event)

    result = Event.get_events({:referral => '1'})

    result.length.should eq(2)
  end

  it  'filters list on tag' do
    @events << FactoryGirl.create(:populated_event, :no_sports_tags, :all_targets)

    result = Event.get_events({:tag => 'sports'})

    result.length.should eq(2)
  end

  it  'filters list on target' do
    @events << FactoryGirl.create(:populated_event, :all_tags, :no_women_targets)

    result = Event.get_events({:target => 'women'})

    result.length.should eq(2)
  end

end
