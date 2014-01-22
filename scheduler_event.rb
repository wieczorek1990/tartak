require_relative 'event'
require_relative 'from_magazine_to_barking_event'
require_relative 'barking_event'
require_relative 'from_barking_to_beams_event'
require_relative 'beams_event'
require_relative 'from_beams_to_boards_event'
require_relative 'boards_event'
require_relative 'from_boards_to_magazine_event'
require_relative 'from_beams_to_magazine_event'

class SchedulerEvent < Event
  BARKING=0
  BEAMS=1
  BOARDS=2
  def initialize(name, duration, params, machine_stations, input_magazine, output_magazine, schedule)
    super(name, duration)
    @params = params
    @machine_stations = machine_stations
    @input_magazine = input_magazine
    @output_magazine = output_magazine
    @schedule = schedule
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

    barking = @machine_stations[BARKING]
    barking.free_machines.times do
      events << FromMagazineToBarkingEvent.new('magazine-barking', @params['magazine_barking_transport_duration'], @schedule, @input_magazine, @params['wood_batch'])
    end

    reserved_barking = [barking.free_machines, @schedule.barking].min
    reserved_barking.times do
      events << BarkingEvent.new('barking', @params['barking_duration'], @schedule, barking)
    end
    barking.reserve(reserved_barking)
    @schedule.barking -= reserved_barking

    @schedule.barking_beams.times do
      events << FromBarkingToBeamsEvent.new('barking-beams', @params['barking_beams_transport_duration'], @schedule)
    end
    @schedule.barking_beams = 0

    beams = @machine_stations[BEAMS]
    reserved_beams = [beams.free_machines, @schedule.beams].min
    reserved_beams.times do
      events << BeamsEvent.new('beams', @params['beams_duration'], @schedule, beams, @params['beams_percentage'])
    end
    beams.reserve(reserved_beams)
    @schedule.beams -= reserved_beams

    @schedule.beams_boards.times do
      events << FromBeamsToBoardsEvent.new('beams-boards', @params['beams_boards_transport_duration'], @schedule)
    end
    @schedule.beams_boards = 0

    @schedule.beams_magazine.times do
      events << FromBeamsToMagazineEvent.new('beams-magazine', @params['beams_magazine_transport_duration'], @schedule, @output_magazine, @params['wood_batch'])
    end
    @schedule.beams_magazine = 0

    boards = @machine_stations[BOARDS]
    reserved_boards = [boards.free_machines, @schedule.boards].min
    reserved_boards.times do
      events << BoardsEvent.new('boards', @params['boards_duration'], @schedule, boards)
    end
    boards.reserve(reserved_boards)
    @schedule.boards -= reserved_boards

    @schedule.boards_magazine.times do
      events << FromBoardsToMagazineEvent.new('boards-magazine', @params['boards_magazine_transport_duration'], @schedule, @output_magazine, @params['wood_batch'])
    end
    @schedule.boards_magazine = 0

    events << SchedulerEvent.new(@name, @duration, @params, @machine_stations, @input_magazine, @output_magazine, @schedule)
  end
end