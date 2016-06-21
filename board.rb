require 'byebug'
require_relative "piece"
require_relative "null_piece"
class Board

  attr_reader :grid
  def initialize(grid = Array.new(8){ Array.new(8) } )
    @grid = grid
    populate
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x,y = pos
    grid[x][y] = piece
  end

  def move(start, end_pos)
    piece = self[start]
    begin
      if piece.is_a?(NullPiece)
        raise NoPieceError.new ("No Piece Error")
      end
      if !piece.valid_move?(end_pos)
        raise InvalidMoveError.new ("Invalid Move Error")
      end
      #TODO revise if we change logic for valid move
      null_piece = self[end_pos]
      #swap the current piece and the null piece
      #self[start] is always a non-Null piaece
      #self[end] (if valid) is always a null piece

      # TODO refine position updating (store in either board or piece, not both?)
      self[start] = null_piece
        null_piece.pos = start
      self[end_pos] = piece
        piece.pos = end_pos

    rescue NoPieceError => e
      puts "There is no piece at that space. Please select another space."
      # retry
    rescue InvalidMoveError => e
      puts "You can't move there!"
      # retry
    end
  end

  alias_method :rows, :grid

  private

  def populate
    positions = File.readlines("populate.txt")
    positions.each_with_index do |row, row_index|

      unless row.include?("0")

        color = nil
        if row_index <= 1
          color = :white
        elsif row_index >= 6
          color = :black
        end


        self.grid[row_index].map!.with_index do |el, column_index|
          name = row[column_index] #e.g. "K"
          el = Piece.new(color, self, [row_index, column_index], name)
        end
      else
        self.grid[row_index].map!.with_index do |el, column_index|
          el = NullPiece.new([row_index, column_index])
        end
      end

    end
  end

end



class NoPieceError < StandardError

end

class InvalidMoveError < StandardError

end
