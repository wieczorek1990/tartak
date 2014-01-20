require 'colorize'

class Event
  def initialize(name, duration, ending_event = nil)
    if duration < 1
      raise 'WRONG DURATION'
    end
    @name = name
    @duration = duration
    @time = 0
    @ending_event = ending_event
  end
  def info
    puts "Processing event \'#{@name}\'".blue
  end
  def process
    puts 'Doing nothing'.yellow
  end
  def update_time
    @time += 1
  end
  def start_of_life?
    @time == 0
  end
  def start_of_life
    puts "Event #{@name} starting".red
  end
  def end_of_life?
    @time == @duration
  end
  def end_of_life
    puts "Event #{@name} ending".red
    @ending_event unless @ending_event.nil?
  end
end