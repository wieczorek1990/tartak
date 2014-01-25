require_relative 'wood_event'

class WoodSoldEvent < WoodEvent
  def start_of_life
    puts "Wood sold (#{@wood})".yellow
    wood = @wood / 2
    @magazine.take_wood(wood, true)
    @magazine.take_wood(wood, false)
    @stats.beams_sold += wood
    @stats.boards_sold += wood * @magazine.boards_from_beam
  end
  def end_of_life
    WoodSoldEvent.new(@name, @duration, @magazine, @wood, @stats)
  end
end