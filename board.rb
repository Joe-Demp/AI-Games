class Board
  def initialize
    @state = []
    @state.fill(' '.to_sym, 0..8)
  end

  def place(symbol, move)
    # @todo implement this
  end

  def finished?
    # @todo implement this
    false
  end

  def ==(other)
    if other.is_a?(Board)
      return @state == other.state
    end
    false
  end

  def to_s
    "#{@state[0]}_|_#{state[1]}_|_#{state[2]}
      #{@state[3]}_|_#{state[4]}_|_#{state[5]}
      #{@state[6]} | #{state[7]} | #{state[8]}"
  end
end
