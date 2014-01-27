require_relative 'machine_station_event'

class BoardsEvent < MachineStationEvent
  def info
  end
  def process
    puts 'Cutting into boards'.yellow
  end
  def end_of_life
    #puts 'Cutting into boards ending'.red
    @machine_station.free(1)
    @schedule.boards_magazine += 1
  end
  def sort
    BOARDS
  end
end