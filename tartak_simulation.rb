require 'yaml'
require_relative 'simulator'
require_relative 'magazine'
require_relative 'wood_arrived_event'
require_relative 'wood_sold_event'
require_relative 'scheduler_event'
require_relative 'machine_station'
require_relative 'schedule'

params = YAML::load_file(File.join(__dir__, 'params.yml'))
input_magazine = Magazine.new(params['input_magazine_starting_capacity'], params['input_magazine_maximal_capacity'])
output_magazine = Magazine.new(params['output_magazine_starting_capacity'], params['output_magazine_maximal_capacity'])
wood_arrived_event = WoodArrivedEvent.new('wood arived', params['wood_arrival_cycle_time'], input_magazine, params['wood_arrived_count'])
wood_sold_event = WoodSoldEvent.new('wood sold', params['wood_selling_cycle_time'], output_magazine, params['wood_sold_count'])
machine_stations = []
machine_stations << MachineStation.new(params['barking_machines'])
machine_stations << MachineStation.new(params['beams_machines'])
machine_stations << MachineStation.new(params['boards_machines'])
schedule = Schedule.new
scheduler_event = SchedulerEvent.new('scheduler', 1, params, machine_stations, input_magazine, output_magazine, schedule)
events = [wood_arrived_event, wood_sold_event, scheduler_event]
Simulator.new(events, params['simulation_duration']).run