require_relative 'event'

class ScheduledEvent < Event
  def initialize(name, duration, schedule)
    super(name, duration)
    @schedule = schedule
  end
  def schedule_op
  end
end