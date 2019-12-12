# frozen_string_literal: true

# Some Documentation about Board
class Board
  def initialize
    @state = []
    @state.fill(' '.to_sym, 0..8)
  end

  def place(symbol, move)
    index = (move.row * 3) + (move.col % 3)
    @state[index] = symbol
  end

  def finished?
    !@state.include?(' '.to_sym)
  end

  def ==(other)
    return @state == other.state if other.is_a?(Board)

    false
  end

  def to_s
    "#{@state[0]}_|_#{@state[1]}_|_#{@state[2]}\n" \
    "#{@state[3]}_|_#{@state[4]}_|_#{@state[5]}\n" \
    "#{@state[6]} | #{@state[7]} | #{@state[8]}"
  end
end
