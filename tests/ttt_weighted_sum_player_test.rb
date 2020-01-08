# frozen_string_literal: true

require 'test/unit'
require_relative '../ttt_weighted_sum_player.rb'
require_relative '../tic_tac_toe.rb'
require_relative '../move.rb'
require_relative '../board_game.rb'

# Test class for TTTWeightedSumPlayer
class TTTWeightedSumPlayerTest < Test::Unit::TestCase
  SPACE = BoardGame::SPACE

  def setup
    @player = TTTWeightedSumPlayer.new(nil, :p)

    @empty_board = TicTacToe.new(nil, nil)

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

    @board_v = TicTacToe.new(nil, nil)
    @board_v.state = [:p, SPACE, :p, SPACE, :p, SPACE, SPACE, SPACE, SPACE]

    @board_a = TicTacToe.new(nil, nil)
    @board_a.state = [:p, SPACE, SPACE, :p, SPACE, :p, SPACE, SPACE, :p]

    @board_b = TicTacToe.new(nil, nil)
    @board_b.state = [:p, SPACE, SPACE, SPACE, :p, :p, :p, SPACE, SPACE]
  end

  def teardown
    TicTacToe.send(:undef_method, :state=)
  end

  def test_score
    assert_equal(Float::INFINITY, @player.score(@finished_board))
    assert_equal(4, @player.score(@board_a))
    assert_equal(7, @player.score(@board_b))
  end

  def test_middle_taken?
    assert_true(@player.middle_taken?(@board_with_middle))
    assert_false(@player.middle_taken?(@empty_board))
  end

  def test_rows_and_columns_with_two
    assert_equal(0, @player.rows_and_columns_with_two(@empty_board))
    assert_equal(0, @player.rows_and_columns_with_two(@board_l))
    assert_equal(4, @player.rows_and_columns_with_two(@board_k))
  end

  def test_number_in_column
    assert_nil(@player.number_in_column(@empty_board, 10))

    assert_equal(0, @player.number_in_column(@empty_board, 1))

    assert_equal(3, @player.number_in_column(@board_l, 0))
    assert_equal(1, @player.number_in_column(@board_l, 2))

    assert_equal(1, @player.number_in_column(@board_k, 1))
    assert_equal(3, @player.number_in_column(@board_k, 2))
  end

  def test_number_in_row
    assert_nil(@player.number_in_row(@empty_board, 10))

    assert_equal(0, @player.number_in_row(@empty_board, 1))

    assert_equal(1, @player.number_in_row(@board_l, 0))
    assert_equal(3, @player.number_in_row(@board_l, 2))

    assert_equal(2, @player.number_in_row(@board_k, 1))
    assert_equal(2, @player.number_in_row(@board_k, 2))
  end

  def test_diagonals_with_two
    assert_equal(0, @player.diagonals_with_two(@empty_board))
    assert_equal(1, @player.diagonals_with_two(@board_l))
    assert_equal(0, @player.diagonals_with_two(@board_k))
    assert_equal(2, @player.diagonals_with_two(@board_v))
  end
end
