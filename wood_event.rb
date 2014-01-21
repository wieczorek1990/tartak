require_relative 'event'

class WoodEvent < Event
  def initialize(name, duration, magazine, wood)
    super(name, duration)
    @magazine = magazine
    @wood = wood
  end
  def info
  end
  def process
  end
end