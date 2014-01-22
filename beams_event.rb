require 'colorize'
require_relative 'machine_station_event'

class BeamsEvent < MachineStationEvent
  def info
  end
  def process
    puts 'Cutting into beams'.yellow
  end
  def end_of_life
    @schedule.beams_boards += 1
    @machine_station.free(1)
  end
end