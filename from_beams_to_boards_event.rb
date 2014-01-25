require_relative 'transporting_event'

class FromBeamsToBoardsEvent < TransportingEvent
  def info
  end
  def process
    puts "Transporting wood from beams to boards".yellow
  end
  def end_of_life
    @schedule.boards += 1
  end
end