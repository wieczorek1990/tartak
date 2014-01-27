require_relative 'scheduled_event'

class MachineStationEvent < ScheduledEvent
  def initialize(name, duration, schedule, machine_station)
    super(name, duration, schedule)
    @machine_station = machine_station
  end
  def start_of_life
  end
end