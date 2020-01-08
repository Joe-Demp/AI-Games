# frozen_string_literal: true

require_relative 'player.rb'

# A Player deciding on it's next move by evaluating boards with a weighted sum
class TTTWeightedSumPlayer < Player
  def get_move(boards_and_moves)
    boards_and_moves.shuffle!
    scores_and_moves = boards_and_moves.map { |pair| [score(pair[0]), pair[1]] }
    scores_and_moves.max_by { |pair| pair[0] }[1]
  end

  def score(board)
    return Float::INFINITY if board.finished?

    score = 0
    score += 3 if middle_taken?(board)
    score += rows_and_columns_with_two(board)
    score + diagonals_with_two(board)
  end

  def middle_taken?(board)
    @symbol == board.symbol_at(Move.new(1, 1))
  end

  def rows_and_columns_with_two(board)
    count = 0
    count += (0...3).count { |num| number_in_column(board, num) == 2 }
    count + (0...3).count { |num| number_in_row(board, num) == 2 }
  end

  def number_in_column(board, column)
    return if column > 2

    (0...3).count { |row| @symbol == board.symbol_at(Move.new(row, column)) }
  end

  def number_in_row(board, row)
    return if row > 2

    (0...3).count { |column| @symbol == board.symbol_at(Move.new(row, column)) }
  end

  def diagonals_with_two(board)
    diagonals = 0

    count = [Move.new(0, 0), Move.new(1, 1), Move.new(2, 2)].count do |move|
      @symbol == board.symbol_at(move)
    end
    diagonals += 1 if count == 2

    count = [Move.new(0, 2), Move.new(1, 1), Move.new(2, 0)].count do |move|
      @symbol == board.symbol_at(move)
    end
    count == 2 ? diagonals + 1 : diagonals
  end
end
