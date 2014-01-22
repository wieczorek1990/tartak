require_relative 'wood_event'

class WoodArrivedEvent < WoodEvent
  def start_of_life
    puts "Wood arrived (#{@wood})".yellow
    @magazine.put_wood(@wood)
  end
  def end_of_life
    WoodArrivedEvent.new(@name, @duration, @magazine, @wood)
  end
end