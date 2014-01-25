require_relative 'wood_event'

class WoodArrivedEvent < WoodEvent
  def start_of_life
    puts "Wood arrived (#{@wood})".yellow
    @magazine.put_wood(@wood)
    @stats.wood_buyed += @wood
  end
  def end_of_life
    WoodArrivedEvent.new(@name, @duration, @magazine, @wood, @stats)
  end
  def sort
    WOOD
  end
end