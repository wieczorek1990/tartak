require_relative 'transporting_event'

class MagazineEvent < TransportingEvent
  def initialize(name, duration, schedule, magazine, wood)
    super(name, duration, schedule)
    @magazine = magazine
    @wood = wood
  end
end