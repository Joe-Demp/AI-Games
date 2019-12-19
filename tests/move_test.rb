require 'test/unit'
require_relative '../move.rb'

class MoveTest < Test::Unit::TestCase
  def setup
    @my_move = Move.new(0, 87)
    @bad_move_1 = Move.new(3, -2)
    @bad_move_2 = Move.new(-4, 0)
    @bad_move_3 = Move.new(-1, -1)
  end

  def test_initialize
    assert_equal(0, @my_move.row)
    assert_equal(87, @my_move.col)

    assert_equal(3, @bad_move_1.row)
    assert_nil(@bad_move_1.col)

    assert_nil(@bad_move_2.row)
    assert_equal(0, @bad_move_2.col)

    assert_nil(@bad_move_3.row)
    assert_nil(@bad_move_3.col)
  end

  def test_valid
    assert(@my_move.valid?)
    assert_false(@bad_move_1.valid?)
    assert_false(@bad_move_2.valid?)
    assert_false(@bad_move_3.valid?)
  end

  def test_to_index
    pend 'Not implemented'
  end

  def test_to_move
    pend 'Not implemented'
  end
end
