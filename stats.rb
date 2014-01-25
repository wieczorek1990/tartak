class Stats
  attr_accessor :working, :idle
  def initialize
    @working = 0
    @idle = 0
  end
  def to_s
    percent = @working.fdiv(@working + @idle) * 100
    "Machine utilization = #{percent.round(2)}%\n" +
    ""
  end
end