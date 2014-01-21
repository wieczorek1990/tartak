class MachineStation
  def initialize(machine, count)
    @machine = machine
    @count = count
    @working = 0
  end
  def full
    @working == @count
  end
  def free_machines
    @count - @working
  end
  def reserve(count)
    if count > free_machines
      raise 'COULDNT RESERVE MACHINES'
    else
      @working += count
    end
  end
  def free(count)
    if count > @working
      raise 'COULNDT FREE MACHINES'
    else
      @working -= count
    end
  end
  def machine_class
    @machine.class
  end
end