require 'colorize'

class Magazine
  def initialize(capacity, maximum_capacity)
    @capacity = capacity
    @maximum_capacity = maximum_capacity
  end
  def process
    puts "Capacity is #{@capacity}/#{@maximum_capacity}".yellow
  end
  def put_wood(wood)
    if @capacity + wood > @maximum_capacity
      puts 'Too much wood'.on_red
      @capacity = @maximum_capacity
    else
      @capacity += wood
    end
  end
  def take_wood(wood)
    if @capacity - wood < 0
      puts 'Not enough wood'.on_red
      0
    else
      @capacity -= wood
      wood
    end
  end
end