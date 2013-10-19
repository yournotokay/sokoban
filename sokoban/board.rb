class Board
  def initialize(rows, columns)
    @rows = rows
    @columns = columns

    @spaces = Array.new(rows) { Array.new(columns) { {occupant: nil, target: false} } }
  end

  def relocate(occupant, x, y)
    @spaces[occupant.y][occupant.x][:occupant] = nil
    occupant.x = x
    occupant.y = y
    @spaces[occupant.y][occupant.x][:occupant] = occupant
  end

  def get_occupant_at(x, y)
    @spaces[y][x][:occupant]
  end

  def on_target?(occupant)
    @spaces[occupant.y][occupant.x][:target]
  end

  def place_target(x, y)
    @spaces[y][x][:target] = true
  end

  def render
    system('clear') unless system('cls')

    @spaces.each.with_index do |row|
      row.each do |space|
        if space[:occupant]
          space[:occupant].render
        elsif space[:target]
          Target.render
        else
          print " "
        end
      end
      print("\n")
    end
  end
end
