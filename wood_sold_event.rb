require 'colorize'
require_relative 'wood_event'

class WoodSoldEvent < WoodEvent
  def start_of_life
    puts "Wood sold (#{@wood})".yellow
    @magazine.take_wood(@wood)
  end
  def end_of_life
    WoodSoldEvent.new(@name, @duration, @magazine, @wood)
  end
end