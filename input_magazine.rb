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
      raise_too_much
    else
      @capacity += wood
    end
  end
  def take_wood(wood)
    if @capacity - wood < 0
      raise_not_enough
    else
      @capacity -= wood
    end
  end
  def raise_too_much
    info
    raise "TOO MUCH WOOD in #{self.class}"
  end
  def raise_not_enough(what='wood')
    info
    raise "NOT ENOUGH WOOD in #{self.class} (#{what})"
  end
end