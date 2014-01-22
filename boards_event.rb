require 'colorize'
require_relative 'machine_station_event'

class BoardsEvent < MachineStationEvent
  def info
  end
  def process
    puts 'Cutting into boards'.yellow
  end
  def end_of_life
    @schedule.boards_magazine += 1
    @machine_station.free(1)
  end
end