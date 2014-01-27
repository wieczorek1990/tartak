require_relative 'machine_station_event'

class BarkingEvent < MachineStationEvent
  def info
  end
  def process
    puts 'Barking'.yellow
  end
  def end_of_life
    puts 'Barking ending'.red
    @machine_station.free(1)
    @schedule.barking_beams += 1
  end
  def sort
    BARKING
  end
end