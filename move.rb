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
end
