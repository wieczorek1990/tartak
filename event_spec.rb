require 'rspec'
require_relative 'event'

describe 'Event' do
  before(:each) do
    @event = Event.new('test', 1)
  end
  it 'should return false' do
    expect(@event.end_of_life?).to eq(false)
  end
  it 'should return true' do
    @event.update_time
    expect(@event.end_of_life?).to eq(true)
  end
end