# frozen_string_literal: true

# Some Documentation about BoardGame
class BoardGame
  SPACE = ' '.to_sym
  def initialize(side_len)
    @side = side_len
    @state = []
    @state.fill(' '.to_sym, 0...(@side**2))
  end

  def each_next_board(symbol)
    # @todo implement tomorrow
    # take a clone of the current board
    # replace its state with a clone of the current state
    #   and a symbol in each empty space
    # yield each next_state
  end

  # @todo think about this method. If the player is going to see prospective boards, do they need to play using 'moves'?
  def place(symbol, move)
    if move_in_bounds?(move)
      index = (move.row * @side) + (move.col % @side)
      @state[index] = symbol
    end
  end

  def finished?
    !@state.include?(' '.to_sym)
  end

  def ==(other)
    return @state == other.state if other.is_a?(BoardGame)

    false
  end

  def to_s
    # @todo implement this to take burden off subclasses
    ''
  end

  private

  def move_in_bounds?(move)
    space_unoccupied = symbol_at(move) != SPACE
    space_unoccupied && move.valid? && move.row < @side && move.col < @side
  end

  def symbol_at(move)
    index = (move.row * @side) + (move.col % @side)
    @state[index]
  end
end
