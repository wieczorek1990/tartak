require 'colorize'
require_relative 'event'

class FromMagazineToBarkingEvent < Event
  def initialize(name, duration, magazine, wood)
    super(name, duration)
    @magazine = magazine
    @wood = wood
  end
  def start_of_life
    @magazine.take_wood(@wood)
  end
  def process
    puts "Transporting #{@wood} wood from magazine to barking".yellow
  end
  def end_of_life
    Event.new('end', 1)
  end
end