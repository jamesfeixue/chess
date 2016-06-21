
require_relative 'piece.rb'
class Rook < Piece


  # def initialize(color, board, pos, name)
  #   super
  # end

  def move_dirs
    [:horizontal, :vertical]
  end
  #
  # def valid_moves
  #   valid_moves = []
  #   move_dirs.each do |dir|
  #     valid_moves << moves(pos)[dir]
  #   end
  #   new_moves = []
  #   valid_moves.each do |direction|
  #     p direction.each do |pos|
  #       unless board[pos].is_a?(Piece)
  #         new_moves << pos
  #       else
  #         if board[pos].color == self.color
  #           puts board[pos]
  #           break
  #         elsif board[pos].color != self.color
  #           new_moves << pos
  #           break
  #         end
  #       end
  #     end
  #   end
  #   new_moves
  # end
end
