class Stats
  attr_accessor :working, :idle, :wood_buyed, :beams_sold, :boards_sold
  def initialize(params)
    @params = params
    @working = 0
    @idle = 0
    @wood_buyed = 0
    @beams_sold = 0
    @boards_sold = 0
  end
  def to_s
    percent = @working.fdiv(@working + @idle) * 100
    cost = @wood_buyed * @params['wood_price']
    income = @beams_sold * @params['beam_price'] + @boards_sold * @params['board_price']
    profit = income - cost
    "Machine utilization: #{percent.round(2)}%\n" +
    "Wood buyed: #{@wood_buyed}\n" +
    "Beams sold: #{@beams_sold}\n" +
    "Boards sold: #{@boards_sold}\n" +
    "Cost: #{cost}\n" +
    "Income: #{income}\n" +
    "Profit: #{profit}\n"
  end
end