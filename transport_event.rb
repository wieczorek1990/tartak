require_relative 'scheduled_event'

class TransportEvent < ScheduledEvent
  def initialize(name, duration, schedule)
    super(name, duration, schedule)
  end
  def sort
    TRANSPORT
  end
  def start_of_life
  end
end