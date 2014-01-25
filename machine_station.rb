class MachineStation
  attr_reader :working_machines
  def initialize(machine_count)
    @machine_count = machine_count
    @working_machines = 0
  end
  def full
    @working_machines == @machine_count
  end
  def free_machines
    @machine_count - @working_machines
  end
  def reserve(count)
    if count > free_machines
      raise 'COULDN\'T RESERVE MACHINES'
    else
      @working_machines += count
    end
  end
  def free(count)
    if count > @working_machines
      raise 'COULND\'T FREE MACHINES'
    else
      @working_machines -= count
    end
  end
end