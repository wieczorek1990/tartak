require_relative 'wood_event'

class WoodSoldEvent < WoodEvent
  def start_of_life
    wood = @magazine.take_wood(@wood)
    puts "Wood sold (#{@wood})".yellow unless wood == 0
  end
  def end_of_life
    WoodSoldEvent.new(@name, @duration, @magazine, @wood)
  end
end