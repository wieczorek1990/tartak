require_relative 'transport_event'

class FromBeamsToBoardsEvent < TransportEvent
  def info
  end
  def process
    puts "Transporting wood from beams to boards".yellow
  end
  def end_of_life
  end
  def schedule_op
    @schedule.boards += 1
  end
end