require 'colorize'
require_relative 'magazine_event'

class FromMagazineToBarkingEvent < MagazineEvent
  def info
  end
  def start_of_life
    wood = @magazine.take_wood(@wood)
    if wood == 0
      @time = @duration
    end
  end
  def process
    puts "Transporting wood from magazine to barking".yellow unless @time == @duration
  end
  def end_of_life
    @schedule.barking += 1
  end
end