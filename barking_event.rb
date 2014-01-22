require_relative 'machine_station_event'

class BarkingEvent < MachineStationEvent
  def info
  end
  def process
    puts 'Barking'.yellow
  end
  def end_of_life
    @schedule.barking_beams += 1
    @machine_station.free(1)
  end
end