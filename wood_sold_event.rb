require_relative 'wood_event'

class WoodSoldEvent < WoodEvent
  def start_of_life
    @magazine.take_wood(@wood / 2, true)
    @magazine.take_wood(@wood / 2, false)
    puts "Wood sold (#{@wood})".yellow
  end
  def end_of_life
    WoodSoldEvent.new(@name, @duration, @magazine, @wood)
  end
end