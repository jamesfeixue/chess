module Slideable

  def moves(current_pos)
    #generate set of valid positions
    valid_positions = Hash.new {|h,k| h[k] = []}
    horizontal_dirs.each do |(dx,dy)|
      new_moves = grow_unblocked_in_direction(current_pos, dx, dy)
      p valid_positions[:horizontal] += new_moves unless new_moves.nil?
    end
    vertical_dirs.each do |(dx,dy)|
      new_moves = grow_unblocked_in_direction(current_pos, dx, dy)
      p valid_positions[:vertical] += new_moves unless new_moves.nil?
    end
    diagonal_dirs.each do |(dx,dy)|
      new_moves = grow_unblocked_in_direction(current_pos, dx, dy)
      p valid_positions[:diagonal_dirs] += new_moves unless new_moves.nil?
    end

    valid_positions
  end

  def horizontal_dirs
    [[0, -1], [0,1]]
  end

  def vertical_dirs
    [[1,0], [-1,0]]
  end
  def diagonal_dirs
    [[-1,1],[-1,-1],[1,1],[1,-1]]
  end

  def grow_unblocked_in_direction(current_pos, dx, dy)
    #debugger
    positions = []
    current_pos = [current_pos[0]+dx, current_pos[1]+dy]
    until !current_pos[0].between?(0,7) || !current_pos[1].between?(0,7)
      current_pos = [current_pos[0]+dx, current_pos[1]+dy]
      positions << current_pos
    end

    positions
  end

end
