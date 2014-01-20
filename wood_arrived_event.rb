require 'colorize'
require_relative 'event'

class WoodArrivedEvent < Event
  def initialize(name, duration, magazine, wood)
    super(name, duration)
    @magazine = magazine
    @wood = wood
  end
  def start_of_life
    puts "Wood arrived (#{@wood})".yellow
    @magazine.add_wood(@wood)
  end
  def process
  end
  def end_of_life
    WoodArrivedEvent.new(@name, @duration, @magazine, @wood)
  end
end