require_relative 'event'

class ScheduledEvent < Event
  def initialize(name, duration, schedule)
    super(name, duration)
    @schedule = schedule
  end
end