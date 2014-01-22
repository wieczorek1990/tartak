require 'colorize'
require_relative 'magazine_event'

class FromBoardsToMagazineEvent < MagazineEvent
  def info
  end
  def process
    puts "Transporting wood from boards to magazine".yellow
  end
  def end_of_life
    @magazine.put_wood(@wood)
  end
end