# frozen_string_literal: true

require 'test/unit'
require_relative '../tic_tac_toe_board.rb'

# Documentation for TicTacToeBoardTest
class TicTacToeBoardTest < Test::Unit::TestCase
  def setup
    @empty_board = TicTacToeBoard.new
    @board_f = TicTacToeBoard.new
    @board_w = TicTacToeBoard.new

    Board.send(:attr_accessor, :state, :side)

    @board_f.state.fill(:x, 0..8)

    @board_w.state[0] = :o
    @board_w.state[4] = :o
    @board_w.state[8] = :o
  end

  def teardown
    Board.send(:undef_method, :state, :side)
  end

  def test_initialize
    assert_equal(3, @empty_board.side)
    # @todo check if this is complete
  end

  def test_finished?
    assert(@board_f.finished?)
    assert(@board_w.finished?)

    pend 'Needs more assertions'
  end

  def test_winning_symbol
    assert_equal(:x, @board_f.winning_symbol)
    assert_equal(:o, @board_w.winning_symbol)

    assert_nil(@empty_board.winning_symbol)

    pend 'Need to test more winning cases'
  end

  def test_to_s
    empty_board_string = " _|_ _|_ \n" \
     " _|_ _|_ \n" \
     '  |   |  '
    assert_equal(empty_board_string, @empty_board.to_s)

    full_board_string = "x_|_x_|_x\n" \
     "x_|_x_|_x\n" \
     'x | x | x'
    assert_equal(full_board_string, @board_f.to_s)
  end

  def test_winning_row
    pend 'Not implemented'
  end

  def test_winning_column
    pend 'Not implemented'
  end

  def test_winning_diagonal
    assert_equal(:o, @board_w.send(:winning_diagonal))
  end
end
