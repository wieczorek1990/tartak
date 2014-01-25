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
      raise 'TOO MUCH WOOD'
    else
      @capacity += wood
    end
  end
  def take_wood(wood)
    if @capacity - wood < 0
      raise 'NOT ENOUGH WOOD'
    else
      @capacity -= wood
    end
  end
end