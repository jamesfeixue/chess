class Piece

  attr_reader :pos, :color, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end


  def valid_move?(position)
    board[position].nil?
  end

  #temp to_s method

  def to_s
    return "p"
  end

  # def pos
  #   x,y = pos
  # end

end
