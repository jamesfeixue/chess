class Piece

  attr_reader :pos, :color, :board
  attr_accessor :name

  def initialize(color, board, pos, name)
    @color = color
    @board = board
    @pos = pos
    @name = name
  end


  def valid_move?(position)
    board[position].nil?
  end

  #temp to_s method

  def to_s
    name
  end

  # def pos
  #   x,y = pos
  # end

end
