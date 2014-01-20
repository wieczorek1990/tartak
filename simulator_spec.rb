require 'rspec'
require_relative 'simulator'

describe 'Simulator' do
  before(:each) do
    @event = Event.new('test', 1)
    @simulator = Simulator.new(@event, 2)
  end
  it 'should simulate' do
    @simulator.run
  end
end