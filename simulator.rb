require_relative 'event'
require_relative 'input_magazine'
require_relative 'scheduler_event'
require_relative 'transport_event'

class Simulator
  def initialize(events, duration)
    unless events.is_a?(Array)
      event = events
      events = [event]
    end
    for event in events
      raise 'WRONG TYPE' unless event.is_a?(Event)
    end
    @events = events
    @duration = duration
  end
  def run
    for t in 0..@duration-1
      phaze(t)
    end
  end
  def phaze(t)
    puts "Time = #{t}".green
    new_events = []
    to_delete = []
    @events.each do |event|
      if event.start_of_life?
        event.start_of_life
      end
      event.info
      event.process
      event.update_time
      if event.end_of_life?
        to_delete.push(event)
        heritage = event.end_of_life
        if heritage.is_a?(Event)
          new_events.push(heritage)
        elsif heritage.is_a?(Array)
          new_events.concat(heritage)
        end
      end
    end
    @events.concat(new_events)
    to_delete.each do |event|
      @events.delete(event)
    end
    @events.sort_by! do |a|
      a.sort
    end
  end
end