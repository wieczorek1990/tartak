class InputMagazine
  def initialize(capacity, maximum_capacity)
    @capacity = capacity
    @maximum_capacity = maximum_capacity
  end
  def put_wood(wood)
    if @capacity + wood > @maximum_capacity
      raise "TOO MUCH WOOD in #{self.class}"
    else
      @capacity += wood
    end
  end
  def take_wood(wood)
    if @capacity - wood < 0
      raise "NOT ENOUGH WOOD in #{self.class}"
    else
      @capacity -= wood
    end
  end
end