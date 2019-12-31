# frozen_string_literal: true

require_relative 'game.rb'

# Some Documentation about BoardGame
class BoardGame < Game
  SPACE = ' '.to_sym
  def initialize(player1, player2, side_len)
    super(player1, player2)
    @side = side_len
    @state = []
    @state.fill(' '.to_sym, 0...(@side**2))
  end

  def each_next_move
    @state.each_index do |index|
      move = Move.to_move(index, @side)
      yield move if move_in_bounds?(move)
    end
  end

  def each_next_board_and_move(symbol)
    each_next_move do |move|
      next_board = clone
      next_board.place(symbol, move)
      yield next_board, move
    end
  end

  def place(symbol, move)
    index = (move.row * @side) + move.col
    @state[index] = symbol
  end

  def opposing_symbol(symbol)
    opponent = @state.find { |sym| sym != SPACE && sym != symbol }
    opponent.nil? ? symbol.succ : opponent
  end

  def finished?
    !@state.include?(' '.to_sym)
  end

  def ==(other)
    return @state == other.state if other.is_a? BoardGame

    false
  end

  def clone
    other = BoardGame.new(@p1, @p2, @side)
    other.state = @state.clone
    other
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

  protected

  attr_writer :state # to allow for cloning

  private

  def move_in_bounds?(move)
    space_unoccupied = symbol_at(move) == SPACE
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
