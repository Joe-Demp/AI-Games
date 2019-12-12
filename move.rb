class Move
  def initialize(row, column)
    @row = row >= 0 ? row : nil
    @col = column >= 0 ? column : nil
  end

  def valid?
    true unless @row.nil? || @col.nil?
  end
end
