require_relative 'point'

class Wall < Point
  def initialize(x, y)
    super(x, y)

    God.board.relocate(self, x, y)
  end

  def render
    print "#"
  end
end