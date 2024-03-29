require 'yaml'
require 'colorize'
require_relative 'simulator'
require_relative 'stats'
require_relative 'input_magazine'
require_relative 'output_magazine'
require_relative 'wood_arrived_event'
require_relative 'wood_sold_event'
require_relative 'scheduler_event'
require_relative 'machine_station'
require_relative 'schedule'
require_relative 'machines'

DEBUG = true

f = File::open('/tmp/log.log', 'w')
begin
  stdout = STDOUT.clone
  STDOUT.reopen(f) unless DEBUG
  if ARGV.count == 0
    filename = 'small.yml'
  else
    filename = ARGV[0]
  end
  puts "Running with params from #{filename}"
  params = YAML::load_file(File.join(__dir__, filename))
  stats = Stats.new(params)
  input_magazine = InputMagazine.new(params['input_magazine_starting_capacity'], params['input_magazine_maximal_capacity'])
  output_magazine = OutputMagazine.new(params['output_magazine_starting_capacity'], params['output_magazine_maximal_capacity'],
                                       params['boards_from_beam'], params['output_magazine_beams'], params['output_magazine_boards'])
  wood_arrived_event = WoodArrivedEvent.new('wood arived', params['wood_arrival_cycle_time'], input_magazine, params['wood_arrived_count'], stats)
  wood_sold_event = WoodSoldEvent.new('wood sold', params['wood_selling_cycle_time'], output_magazine, params['wood_sold_count'], stats, params['boards_percentage'])
  machine_stations = []
  machine_stations[Machines::BARKING] = MachineStation.new(params['barking_machines'])
  machine_stations[Machines::BEAMS] = MachineStation.new(params['beams_machines'])
  machine_stations[Machines::BOARDS] = MachineStation.new(params['boards_machines'])
  schedule = Schedule.new
  scheduler_event = SchedulerEvent.new('scheduler', 1, schedule, params, machine_stations, input_magazine, output_magazine, stats)
  events = [wood_arrived_event, wood_sold_event, scheduler_event]
  Simulator.new(events, params['simulation_duration']).run
ensure
  f.close
  STDOUT.reopen(stdout) unless DEBUG
  puts
  puts stats
end