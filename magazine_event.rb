require_relative 'scheduled_event'

class MagazineEvent < ScheduledEvent
  def initialize(name, duration, schedule, magazine, wood)
    super(name, duration, schedule)
    @magazine = magazine
    @wood = wood
  end
end