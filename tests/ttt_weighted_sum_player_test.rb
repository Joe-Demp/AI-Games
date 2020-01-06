require 'test/unit'
require_relative '../ttt_weighted_sum_player.rb'
require_relative '../tic_tac_toe.rb'
require_relative '../move.rb'
require_relative '../board_game.rb'

# @todo implement this
class TTTWeightedSumPlayerTest < Test::Unit::TestCase
  SPACE = BoardGame::SPACE

  def setup
    @player = TTTWeightedSumPlayer.new(nil, :p)

    @empty_board = TicTacToe.new(nil, nil )

    @board_with_middle = TicTacToe.new(nil, nil)
    @board_with_middle.place(:p, Move.new(1, 1))

    TicTacToe.send(:attr_writer, :state)
    @finished_board = TicTacToe.new(nil, nil)
    @finished_board.state =
      [:p, SPACE, SPACE, :p, SPACE, SPACE, :p, SPACE, SPACE]

    @board_l = TicTacToe.new(nil, nil)
    @board_l.state = [:p, SPACE, SPACE, :p, SPACE, SPACE, :p, :p, :p]

    @board_k = TicTacToe.new(nil, nil)
    @board_k.state = [:p, SPACE, :p, SPACE, :p, :p, :p, SPACE, :p]
  end

  def teardown
    TicTacToe.send(:undef_method, :state=)
  end

  def test_score
    assert_equal(Float::INFINITY, @player.score(@finished_board))

    pend 'Not fully implemented'
  end

  def test_middle_taken?
    assert_true(@player.middle_taken?(@board_with_middle))
    assert_false(@player.middle_taken?(@empty_board))
  end

  def test_rows_and_columns_with_two
    pend 'Not Implemented'
  end

  def test_number_in_column
    pend 'Not Implemented'
  end

  def test_number_in_row
    pend 'Not Implemented'
  end
end