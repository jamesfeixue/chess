class Piece

  attr_reader :color, :board
  attr_accessor :name, :pos

  def initialize(color, board=Board.new, pos, name)
    @color = color
    @board = board
    @pos = pos
    @name = name
  end


  def valid_move?(position)
    board[position].is_a?(NullPiece)
  end

  #temp to_s method

  def to_s
    name
  end

  # def pos
  #   x,y = pos
  # end

end
