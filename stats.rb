class Stats
  attr_accessor :working, :idle
  def initialize
    @working = 0
    @idle = 0
  end
  def to_s
    percent = @working.fdiv(@working + @idle)
    "Machine utilization = #{percent}\n" +
    "The rest is here."
  end
end