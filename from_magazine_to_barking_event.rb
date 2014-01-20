require 'colorize'
require_relative 'event'

class FromMagazineToBarkingEvent < Event
  def initialize(name, duration, ending_event, magazine, wood)
    super(name, duration, ending_event)
    @magazine = magazine
    @wood = wood
  end
  def start_of_life
    @magazine.take_wood(@wood)
  end
  def process
    "Transporting #{@wood} wood from magazine to barking".yellow
  end
end