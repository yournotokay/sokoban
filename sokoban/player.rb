require_relative 'point'

class Player < Point
  def initialize(x, y)
    super(x, y)

    God.board.relocate(self, x, y)
  end

  def left
    move(x - 1, y)
  end
  def right
    move(x + 1, y)
  end
  def up
    move(x, y - 1)
  end
  def down
    move(x, y + 1)
  end

  def move(new_x, new_y)
    occupant = God.board.get_occupant_at(new_x, new_y)
    if occupant.nil?
      God.board.relocate(self, new_x, new_y)
    elsif occupant.is_a?(Crate)
      new_crate_x = occupant.x + (new_x - x)
      new_crate_y = occupant.y + (new_y - y)

      if God.board.get_occupant_at(new_crate_x, new_crate_y).nil?
        God.board.relocate(occupant, new_crate_x, new_crate_y)

        God.board.relocate(self, new_x, new_y)
      end
    end
  end

  def render
    print God.board.on_target?(self) ? '+' : '@'
  end
end