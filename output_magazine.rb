require_relative 'input_magazine'

class OutputMagazine < InputMagazine
  attr_reader :beams, :boards, :boards_from_beam
  def initialize(capacity, maximum_capacity, boards_from_beam, beams, boards)
    super(capacity, maximum_capacity)
    if capacity != beams + boards/boards_from_beam
      raise "WRONG CAPACITY\n#{capacity} != #{beams} + #{boards}/#{boards_from_beam}"
    end
    @boards_from_beam = boards_from_beam
    @beams = beams
    @boards = boards
  end
  def put_wood(wood, is_beam)
    super(wood)
    if is_beam
      @beams += wood
    else
      @boards += wood * @boards_from_beam
    end
  end
  def take_wood(wood, is_beam)
    if is_beam and
      if @beams - wood < 0
        raise_not_enough('beams')
      else
        @beams -= wood
      end
    else
      if @boards - wood * @boards_from_beam < 0
        raise_not_enough('boards')
      else
        @boards -= wood * @boards_from_beam
      end
    end
  end
end