# frozen_string_literal: true
require 'test/unit'
require_relative '../move.rb'

class MoveTest < Test::Unit::TestCase
  def setup
    @my_move = Move.new(0, 87)
    @move1 = Move.new(2, 3)
    @move2 = Move.new(5, 7)

    @bad_move1 = Move.new(3, -2)
    @bad_move2 = Move.new(-4, 0)
    @bad_move3 = Move.new(-1, -1)
  end

  def test_initialize
    assert_equal(0, @my_move.row)
    assert_equal(87, @my_move.col)

    assert_equal(3, @bad_move1.row)
    assert_nil(@bad_move1.col)

    assert_nil(@bad_move2.row)
    assert_equal(0, @bad_move2.col)

    assert_nil(@bad_move3.row)
    assert_nil(@bad_move3.col)
  end

  def test_valid
    assert(@my_move.valid?)
    assert_false(@bad_move1.valid?)
    assert_false(@bad_move2.valid?)
    assert_false(@bad_move3.valid?)
  end

  def test_to_index
    assert_equal(87, @my_move.to_index(88))

    assert_equal(11, @move1.to_index(4))
    assert_equal(19, @move1.to_index(8))

    assert_equal(47, @move2.to_index(8))
    assert_equal(57, @move2.to_index(10))
  end

  def test_to_move
    assert_equal(@my_move, Move.to_move(87, 100))

    assert_equal(@move1, Move.to_move(11, 4))
    assert_equal(@move1, Move.to_move(19, 8))

    assert_equal(@move2, Move.to_move(47, 8))
    assert_equal(@move2, Move.to_move(57, 10))
  end
end
