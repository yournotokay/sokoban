require_relative 'point'

class Target < Point
  def initialize(x, y)
    God.board.place_target(x, y)
  end

  def self.render
    print '.'
  end
end