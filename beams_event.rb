require_relative 'machine_station_event'

class BeamsEvent < MachineStationEvent
  def initialize(name, duration, schedule, machine_station, boards_percentage)
    super(name, duration, schedule, machine_station)
    @boards_percentage = boards_percentage
  end
  def info
  end
  def process
    puts 'Cutting into beams'.yellow
  end
  def end_of_life
    puts 'Cutting into beams ending'.red
    @machine_station.free(1)
    if rand < @boards_percentage
      @schedule.beams_boards += 1
    else
      @schedule.beams_magazine += 1
    end
  end
  def sort
    BEAMS
  end
end