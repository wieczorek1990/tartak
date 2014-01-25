require_relative 'scheduled_event'

class TransportingEvent < ScheduledEvent
  def initialize(name, duration, schedule)
    super(name, duration, schedule)
  end
end