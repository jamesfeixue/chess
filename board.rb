require_relative "piece"

class Board

  attr_reader :grid
  def initialize(grid = Array.new(8){ Array.new(8) } )
    @grid = grid
    populate
  end

  private

  def populate
    grid.each_with_index do |row, i|
      row.each_with_index do |column, j|
        self.grid[i][j] = Piece.new([i, j])
      end
    end
  end

end
