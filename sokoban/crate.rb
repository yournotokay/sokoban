require_relative 'point'

class Crate < Point
  def initialize(x, y)
    super(x, y)

    God.board.relocate(self, x, y)
  end

  def render
    print God.board.on_target?(self) ? '*' : 'o'
  end
end