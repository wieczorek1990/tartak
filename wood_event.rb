require_relative 'event'

class WoodEvent < Event
  def initialize(name, duration, magazine, wood, stats)
    super(name, duration)
    @magazine = magazine
    @wood = wood
    @stats = stats
  end
  def info
  end
  def process
  end
end