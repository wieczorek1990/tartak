require_relative 'machine_station_event'

class BeamsEvent < MachineStationEvent
  def initialize(name, duration, schedule, machine_station, beams_percentage)
    super(name, duration, schedule, machine_station)
    @beams_percentage = beams_percentage
  end
  def info
  end
  def process
    puts 'Cutting into beams'.yellow
  end
  def end_of_life
    if rand < @beams_percentage
      @schedule.beams_boards += 1
    else
      @schedule.beams_magazine += 1
    end
    @machine_station.free(1)
  end
end