require_relative 'wood_event'

class WoodSoldEvent < WoodEvent
  def initialize(name, duration, magazine, wood, stats, boards_percentage)
    super(name, duration, magazine, wood, stats)
    @boards_percentage = boards_percentage
  end
  def start_of_life
    puts "Wood sold (#{@wood})".yellow
    beams = (@boards_percentage * @wood).round
    boards = @wood - beams
    @magazine.take_wood(beams, true)
    @magazine.take_wood(boards, false)
    @stats.beams_sold += beams
    @stats.boards_sold += boards * @magazine.boards_from_beam
  end
  def end_of_life
    WoodSoldEvent.new(@name, @duration, @magazine, @wood, @stats, @boards_percentage)
  end
  def sort
    WOOD
  end
end