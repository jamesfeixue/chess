require_relative "slideable"
require_relative 'piece.rb'
class Rook < Piece
  include Slideable

  def initialize(color, board, pos, name)
    super
  end
end
