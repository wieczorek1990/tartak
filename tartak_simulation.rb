require 'yaml'
require_relative 'simulator'
require_relative 'magazine'
require_relative 'wood_arrived_event'
require_relative 'wood_sold_event'
require_relative 'scheduler_event'
require_relative 'barking_machine'
require_relative 'cutting_into_beams_machine'
require_relative 'cutting_into_boards_machine'
require_relative 'machine_station'

params = YAML::load_file(File.join(__dir__, 'params.yml'))
input_magazine = Magazine.new(params['input_magazine_starting_capacity'], params['input_magazine_maximal_capacity'])
output_magazine = Magazine.new(params['output_magazine_starting_capacity'], params['output_magazine_maximal_capacity'])
wood_arrived_event = WoodArrivedEvent.new('wood arived', params['wood_arrival_cycle_time'], input_magazine, params['wood_arrived_count'])
wood_sold_event = WoodSoldEvent.new('wood sold', params['wood_selling_cycle_time'], output_magazine, params['wood_sold_count'])
barking_machine = BarkingMachine.new(params['barking_duration'])
cutting_into_beams_machine = CuttingIntoBeamsMachine.new(params['cutting_into_beams_duration'])
cutting_into_boards_machine = CuttingIntoBoardsMachine.new(params['cutting_into_boards_duration'])
machines_stations = []
machines_stations << MachineStation.new(barking_machine, params['barking_machines'])
machines_stations << MachineStation.new(cutting_into_beams_machine, params['cutting_into_beams_machines'])
machines_stations << MachineStation.new(cutting_into_boards_machine, params['cutting_into_boards_machines'])
scheduler_event = SchedulerEvent.new('scheduler', 1, params, machines_stations, input_magazine, output_magazine)
events = [wood_arrived_event, wood_sold_event, scheduler_event]
Simulator.new(events, params['simulation_duration']).run