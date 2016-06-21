class NullPiece < Piece
  include Singleton 

  def to_s
    " "
  end
end
