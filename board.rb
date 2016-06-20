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

  end

  private

  def populate
    positions = File.readlines("populate.txt")
    #debugger
    positions.each_with_index do |row, index|
      unless row == "\n"
        self.grid[index] = positions[index]
      end
    end



    # grid.each_with_index do |row, i|
    #   row.each_with_index do |column, j|
    #     self.grid[i][j] = Piece.new([i, j])
    #   end
    # end
  end

end
