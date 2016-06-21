require 'colorize'
class Display

  attr_reader :selected, :cursor, :board

  def initialize(board)
    @cursor = [0,0]
    @selected = false
    @board = board
  end

  def move(new_pos)
    cursor = new_pos
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
    unless piece == nil
      foreground = get_piece_colors(piece)
    end
      {background: background, color: foreground}
  end


  def get_bg_colors(pos) # make sure this returns a new square
    # if cursor then render
    x, y = pos
    if  pos == cursor
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

  def get_piece_colors(piece)
    piece.color
  end



  def render
    system("clear")
    # puts "" for key mappings
    build_grid.each {|row| puts row.join}
  end

end
