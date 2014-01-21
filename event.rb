require 'colorize'

class Event
  attr_reader :name
  def initialize(name, duration)
    if duration < 1
      raise 'WRONG DURATION'
    end
    @name = name
    @duration = duration
    @time = 0
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
  end
end