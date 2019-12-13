# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'move.rb'

# Some Documentation about TicTacToeBoard
class TicTacToeBoard < Board
  def initialize
    super(3)
  end

  def finished?
    !winning_symbol.nil? || super
  end

  def winning_symbol
    winning_row || winning_column || winning_diagonal
  end

  def to_s
    "#{@state[0]}_|_#{@state[1]}_|_#{@state[2]}\n" \
    "#{@state[3]}_|_#{@state[4]}_|_#{@state[5]}\n" \
    "#{@state[6]} | #{@state[7]} | #{@state[8]}"
  end

  private

  def winning_row
    (0...3).each do |row|
      sym = @state[row * 3]
      won = true
      (1...3).each do |col|
        won &&= (sym == symbol_at(Move.new(row, col)))
      end
      if won
        return sym unless sym == SPACE
      end
    end
    nil
  end

  def winning_column
    (0...3).each do |col|
      sym = @state[col]
      won = true
      (1...3).each do |row|
        won &&= (sym == symbol_at(Move.new(row, col)))
      end
      if won
        return sym unless sym == SPACE
      end
    end
    nil
  end

  def winning_diagonal
    sym = @state[4]
    diagonal = lambda do |arr|
      won = true
      arr.each do |index|
        won &&= (sym == @state[index])
      end
      if won
        return sym unless sym == SPACE
      end
    end

    diagonal.call([0, 4, 8]) || diagonal.call([2, 4, 6])
  end
end
