require_relative 'transporting_event'

class FromBarkingToBeamsEvent < TransportingEvent
  def info
  end
  def process
    puts "Transporting wood from barking to beams".yellow
  end
  def end_of_life
    @schedule.beams += 1
  end
end