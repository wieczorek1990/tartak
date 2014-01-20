require 'yaml'
require 'colorize'
require_relative 'event'
require_relative 'magazine'

class Simulator
  def initialize(events, duration)
    unless events.kind_of?(Array)
      event = events
      events = []
      events.push(event)
    end
    for event in events
      raise 'WRONG TYPE' unless event.is_a?(Event)
    end
    @events = events
    @duration = duration
  end
  def run
    for t in 0..@duration-1
      puts "Time = #{t}".green
      for event in @events
        if event.start_of_life?
          event.start_of_life
        end
        event.info
        event.process
        event.update_time
        if event.end_of_life?
          @events.delete(event)
          heritage = event.end_of_life
          if heritage.is_a?(Event)
            @events.push(heritage)
          end
        end
      end
    end
  end
end

