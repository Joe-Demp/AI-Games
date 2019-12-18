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

  # @todo The player will see prospective boards, do they need to play using moves?
  def place(symbol, move)
    return unless move_in_bounds?(move)

    index = (move.row * @side) + (move.col % @side)
    @state[index] = symbol
  end

  def finished?
    !@state.include?(' '.to_sym)
  end

  def ==(other)
    return @state == other.state if other.is_a? BoardGame

    false
  end

  def to_s
    board = ''
    0.upto(@side - 2) do |i|
      first_index = i * @side
      board += row_to_s(first_index)
    end
    first_index = (@side - 1) * @side
    board + row_to_s(first_index, true)
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

  def row_to_s(first_number, last_row = false)
    return last_row_to_s(first_number) if last_row

    row = ''
    # add all but one symbol to string in format 1_|_2_|_3...
    0.upto(@side - 2) do |i|
      row += "#{@state[first_number + i]}_|_"
    end

    # once more with #{@state[first_number + @side - 1]}
    row + "#{@state[first_number + @side - 1]}\n"
  end

  def last_row_to_s(first_number)
    row = ''
    # add all but one symbol to string in format 1 | 2 | 3...
    0.upto(@side - 2) do |i|
      row += "#{@state[first_number + i]} | "
    end

    # once more with #{@state[first_number + @side - 1]}
    row + "#{@state[first_number + @side - 1]}\n"
  end
end
