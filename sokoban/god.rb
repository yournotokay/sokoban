class God
  class << self

    attr_accessor :board, :player, :crates, :walls, :targets

    def start(game_path = nil)
      @walls = []
      @crates = []
      @targets = []

      if game_path.nil?
        @board = Board.new(10, 5)
        @player = Player.new(3, 1)
        @crates << Crate.new(2, 1)

        (0..4).each do |x|
          @walls << Wall.new(x, 0)
          @walls << Wall.new(x, 2)
        end
        @walls << Wall.new(0, 1)
        @walls << Wall.new(4, 1)

        @targets << Target.new(1, 1)
      else
        read_level(game_path)
      end

      input = ''
      until (input == 'q') do
        @board.render
        input = STDIN.getch
        move(input)
      end
    end

    def move(input)
      case (input)
        when 'A'
          player.up
        when 'B'
          player.down
        when 'C'
          player.right
        when 'D'
          player.left
      end
    end

    def read_level(level_path)
      File.open(level_path) do |file|
        lines = file.readlines
        columns = lines.map(&:length).max
        @board = Board.new(lines.length, columns)
        lines.each.with_index do |line, y|
          line.each_char.with_index do |char, x|
            case char
              when '#'
                @walls << Wall.new(x, y)
              when 'o'
                @crates << Crate.new(x, y)
              when '.'
                @targets << Target.new(x, y)
              when '@'
                @player = Player.new(x, y)
            end
          end
        end
      end
    end
  end
end
