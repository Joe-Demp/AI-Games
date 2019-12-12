# frozen_string_literal: true

require 'test/unit'
require_relative '../board.rb'
require_relative '../move.rb'

# Some Documentation about BoardTest
class BoardTest < Test::Unit::TestCase
  def setup
    @empty_board = Board.new
    @board_a = Board.new
    @board_f = Board.new
    @board_p = Board.new

    Board.send(:attr_accessor, :state)

    @board_a.place(:x, Move.new(0, 0))
    @board_a.place(:o, Move.new(1, 1))
    @board_a.place(:o, Move.new(2, 1))

    @board_p.state[0] = :x
    @board_p.state[4] = :o
    @board_p.state[7] = :o

    @board_f.state.fill(:x, 0..8)
  end

  def teardown
    Board.send(:undef_method, :state)
  end

  def test_place
    assert_equal(:x, @board_a.state[0])
    assert_equal(:o, @board_a.state[4])
    assert_equal(:o, @board_a.state[7])
  end

  def test_finished?
    assert_false(@empty_board.finished?)
    assert_false(@board_a.finished?)
    assert(@board_f.finished?)
  end

  def test_equality
    empty_b = Board.new
    assert_equal(empty_b, @empty_board)
    assert(@board_a == @board_p)
  end

  def test_to_s
    empty_board_string = " _|_ _|_ \n" \
     " _|_ _|_ \n" \
     "  |   |  "
    assert_equal(empty_board_string, @empty_board.to_s)

    full_board_string = "x_|_x_|_x\n" \
     "x_|_x_|_x\n" \
     "x | x | x"
    assert_equal(full_board_string, @board_f.to_s)
  end
end
