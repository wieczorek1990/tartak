require_relative 'scheduled_event'
require_relative 'from_magazine_to_barking_event'
require_relative 'barking_event'
require_relative 'from_barking_to_beams_event'
require_relative 'beams_event'
require_relative 'from_beams_to_boards_event'
require_relative 'boards_event'
require_relative 'from_boards_to_magazine_event'
require_relative 'from_beams_to_magazine_event'
require_relative 'machines'

class SchedulerEvent < ScheduledEvent
  def initialize(name, duration, schedule, params, machine_stations, input_magazine, output_magazine, stats)
    super(name, duration, schedule)
    @params = params
    @machine_stations = machine_stations
    @input_magazine = input_magazine
    @output_magazine = output_magazine
    @stats = stats
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

    # MAGAZINE - BARKING
    barking = @machine_stations[Machines::BARKING]
    magazine_barking_carts = [barking.free_machines, @params['parallel_carts']].min
    magazine_barking_carts.times do
      events << FromMagazineToBarkingEvent.new('magazine-barking', @params['magazine_barking_transport_duration'], @schedule, @input_magazine, @params['wood_batch'])
    end

    # BARKING
    reserved_barking = [barking.free_machines, @schedule.barking].min
    reserved_barking.times do
      events << BarkingEvent.new('barking', @params['barking_duration'], @schedule, barking)
    end
    barking.reserve(reserved_barking)
    @schedule.barking -= reserved_barking

    #BARKING - BEAMS
    barking_beams_carts = [@schedule.barking_beams, @params['parallel_carts']].min
    barking_beams_carts.times do
      events << FromBarkingToBeamsEvent.new('barking-beams', @params['barking_beams_transport_duration'], @schedule)
    end
    @schedule.barking_beams -= barking_beams_carts

    # BEAMS
    beams = @machine_stations[Machines::BEAMS]
    reserved_beams = [beams.free_machines, @schedule.beams].min
    reserved_beams.times do
      events << BeamsEvent.new('beams', @params['beams_duration'], @schedule, beams, @params['boards_percentage'])
    end
    beams.reserve(reserved_beams)
    @schedule.beams -= reserved_beams

    # BEAMS - BOARDS
    beams_boards_carts = [@schedule.beams_boards, @params['parallel_carts']].min
    beams_boards_carts.times do
      events << FromBeamsToBoardsEvent.new('beams-boards', @params['beams_boards_transport_duration'], @schedule)
    end
    @schedule.beams_boards -= beams_boards_carts

    # BEAMS - MAGAZINE
    beams_magazine_carts = [@schedule.beams_magazine, @params['parallel_carts']].min
    beams_magazine_carts.times do
      events << FromBeamsToMagazineEvent.new('beams-magazine', @params['beams_magazine_transport_duration'], @schedule, @output_magazine, @params['wood_batch'])
    end
    @schedule.beams_magazine -= beams_magazine_carts

    # BOARDS
    boards = @machine_stations[Machines::BOARDS]
    reserved_boards = [boards.free_machines, @schedule.boards].min
    reserved_boards.times do
      events << BoardsEvent.new('boards', @params['boards_duration'], @schedule, boards)
    end
    boards.reserve(reserved_boards)
    @schedule.boards -= reserved_boards

    # BOARDS - MAGAZINE
    boards_magazine_carts = [@schedule.boards_magazine, @params['parallel_carts']].min
    boards_magazine_carts.times do
      events << FromBoardsToMagazineEvent.new('boards-magazine', @params['boards_magazine_transport_duration'], @schedule, @output_magazine, @params['wood_batch'])
    end
    @schedule.boards_magazine -= boards_magazine_carts

    @stats.idle += barking.free_machines + beams.free_machines + boards.free_machines
    @stats.working += barking.working_machines + beams.working_machines + boards.working_machines
    events << SchedulerEvent.new(@name, @duration, @schedule, @params, @machine_stations, @input_magazine, @output_magazine, @stats)
  end
  def sort
    SCHEDULER
  end
end