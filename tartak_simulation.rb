require_relative 'simulator'
require_relative 'magazine'
require_relative 'wood_arrived_event'
require_relative 'from_magazine_to_barking_event'

params = YAML::load_file(File.join(__dir__, 'params.yml'))
input_magazine = Magazine.new(params['input_magazine_starting_capacity'], params['input_magazine_maximal_capacity'])
output_magazine = Magazine.new(params['output_magazine_starting_capacity'], params['output_magazine_maximal_capacity'])
wood_arrived_event = WoodArrivedEvent.new('wood arived', params['wood_arrival_cycle_time'], input_magazine, params['wood_arrived_count'])
from_magazine_to_barking_event = FromMagazineToBarkingEvent.new('cart magazine-barking', params['magazine_barking_transport_duration'], Event.new('end', 1), input_magazine, params['wood_batch'])
events = [wood_arrived_event, from_magazine_to_barking_event]
Simulator.new(events, params['simulation_duration']).run