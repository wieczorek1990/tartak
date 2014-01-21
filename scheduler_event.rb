require_relative 'event'
require_relative 'barking_machine'
require_relative 'from_magazine_to_barking_event'

class SchedulerEvent < Event
  def initialize(name, duration, params, machine_stations, input_magazine, output_magazine)
    super(name, duration)
    @params = params
    @machine_stations = machine_stations
    @input_magazine = input_magazine
    @output_magazine = output_magazine
  end
  def start_of_life
  end
  def info
  end
  def process
    puts 'Scheduling'.yellow
  end
  def end_of_life
    events = []
    for machine_station in @machine_stations
      # TODO
      if machine_station.machine_class == BarkingMachine
        machine_station.free_machines.times do
          events.push(FromMagazineToBarkingEvent.new('magazine-barking', @params['magazine_barking_transport_duration'], @input_magazine, @params['wood_batch']))
        end
        machine_station.reserve(machine_station.free_machines)
      end
    end
    [SchedulerEvent.new(@name, @duration, @params, @machine_stations, @input_magazine, @output_magazine)].concat(events)
  end
end