require 'colorize'
require_relative 'cursorable'
require_relative 'board'
class Display

  include Cursorable


  attr_reader :cursor_pos, :board
  attr_accessor :selected

  def initialize(board)
    @cursor_pos = [0,0]
    @selected = false
    @board = board
    @move_from = nil
    @move_to = nil
  end

  def move(new_pos)
    cursor_pos = new_pos
    render
  end

  def build_grid
    board.rows.map.with_index do |row, row_number|
      build_row(row, row_number)
    end
  end

  def build_row(row, row_number)
    row.map.with_index do |piece, column_number|
      color_options = get_colors(piece, [row_number, column_number])
      square = piece.to_s.colorize(color_options)
    end
  end

  def get_colors(piece, pos)

    background = get_bg_colors(pos)
    foreground = nil
    unless piece.is_a?(NullPiece)
      foreground = get_piece_colors(piece)
    end
      {background: background, color: foreground}
  end


  def get_bg_colors(pos) # make sure this returns a new square
    # if cursor then render
    x, y = pos
    if  pos == cursor_pos
      color = :red
    elsif (x + y) % 2 == 0
      color = :light_blue
    elsif (x + y) % 2 == 1
      color =  :yellow
    else
      puts "error"
    end

    # if not cursor, depends on position

  end

  def make_move
    board.move(@move_from, @move_to)
  end

  def get_piece_colors(piece)
    piece.color
  end



  def render
    system("clear")
    # puts "" for key mappings
    build_grid.each {|row| puts row.join}
  end

end
b = Board.new
d = Display.new(b)

while true
  d.render
  d.get_input

end
