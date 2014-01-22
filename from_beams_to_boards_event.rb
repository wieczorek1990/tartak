require_relative 'scheduled_event'

class FromBeamsToBoardsEvent < ScheduledEvent
  def info
  end
  def process
    puts "Transporting wood from beams to boards".yellow
  end
  def end_of_life
    @schedule.boards += 1
  end
end