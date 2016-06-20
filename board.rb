require 'byebug'
require_relative "piece"
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
    #TODO replace string_piece with real piece
    begin
      if self[start].nil?
        raise NoPieceError("There's no piece there!")
      end
      #TODO call piece valid_move? method

      self[start] = nil
      self[end_pos] = piece

    rescue NoPieceError => e
      puts "There is no piece at that space. Please select another space."
      retry
    rescue InvalidMoveError => e
      puts "You can't move there!"
      retry
    end
  end

  private

  def populate
    positions = File.readlines("populate.txt")
    positions.each_with_index do |row, row_index|

      unless row == "\n"

        color = nil
        if row_index <= 1
          color = :white
        elsif row_index >= 6
          color = :black
        end

        column_index = 0
        self.grid[row_index].map! do |el|
          column_index += 1
          el = Piece.new(color, self, [row_index, column_index-1])
        end
      end
    end
  end

end



class NoPieceError < StandardError

end

class InvalidMoveError < StandardError

end
