class NullPiece < Piece
  def initialize(pos)
    @pos = pos
  end

  def to_s
    " "
  end
end
