require 'colorize'
require_relative 'magazine_event'

class FromMagazineToBarkingEvent < MagazineEvent
  def info
  end
  def start_of_life
    @magazine.take_wood(@wood)
  end
  def process
    puts "Transporting wood from magazine to barking".yellow
  end
  def end_of_life
    @schedule.barking += 1
  end
  def sort
    MAGAZINE_BARKING
  end
end