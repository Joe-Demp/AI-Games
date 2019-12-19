# frozen_string_literal: true

# Some Documentation about Move
class Move
  attr_reader :row, :col

  def initialize(row, column)
    @row = row >= 0 ? row : nil
    @col = column >= 0 ? column : nil
  end

  def valid?
    !(@row.nil? || @col.nil?)
  end

  def to_index(side)
    (@row * side) + @column
  end

  def self.to_move(index, side_length)
    Move.new(index / side_length, index % side_length)
  end
end
