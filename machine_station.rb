class MachineStation
  def initialize(machine_count)
    @machine_count = machine_count
    @working = 0
  end
  def full
    @working == @machine_count
  end
  def free_machines
    @machine_count - @working
  end
  def reserve(count)
    if count > free_machines
      raise 'COULDN\'T RESERVE MACHINES'
    else
      @working += count
    end
  end
  def free(count)
    if count > @working
      raise 'COULND\'T FREE MACHINES'
    else
      @working -= count
    end
  end
end