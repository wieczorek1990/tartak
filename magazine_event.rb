require_relative 'transport_event'

class MagazineEvent < TransportEvent
  def initialize(name, duration, schedule, magazine, wood)
    super(name, duration, schedule)
    @magazine = magazine
    @wood = wood
  end
end