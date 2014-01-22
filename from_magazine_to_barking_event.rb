require 'colorize'
require_relative 'magazine_event'

class FromMagazineToBarkingEvent < MagazineEvent
  def info
  end
  def start_of_life
    wood = @magazine.take_wood(@wood)
    if wood == 0
      @killed = true
    end
  end
  def process
    puts "Transporting wood from magazine to barking".yellow unless @killed
  end
  def end_of_life
    @schedule.barking += 1 unless @killed
  end
end