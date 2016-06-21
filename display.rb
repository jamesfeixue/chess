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
