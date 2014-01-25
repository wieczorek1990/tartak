class InputMagazine
  def initialize(capacity, maximum_capacity)
    @capacity = capacity
    @maximum_capacity = maximum_capacity
  end
  def info
    puts "Capacity: #{@capacity}/#{@maximum_capacity}".on_red
  end
  def put_wood(wood)
    if @capacity + wood > @maximum_capacity
      info
      raise "TOO MUCH WOOD in #{self.class}"
    else
      @capacity += wood
    end
  end
  def take_wood(wood)
    if @capacity - wood < 0
      info
      raise "NOT ENOUGH WOOD in #{self.class}"
    else
      @capacity -= wood
    end
  end
end