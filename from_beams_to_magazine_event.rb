require_relative 'magazine_event'

class FromBeamsToMagazineEvent < MagazineEvent
  def info
  end
  def process
    puts "Transporting wood from beams to magazine".yellow
  end
  def end_of_life
    @magazine.put_wood(@wood, true)
  end
end