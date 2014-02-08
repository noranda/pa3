# maze_generator.rb
# Written by: Noranda Brown
# Version: 2014.2.7

class MazeGenerator

  attr_reader :maze

  ##
  #
  def initialize(maze)
    @maze = maze
  end


  ##
  # Resets all of the cells and walls and comes up with a random new maze of the same size.
  def redesign
    new_string = ''
    new_string << ('1' * (@maze.width * 2 + 1))             # top row
    new_string << middle_rows_redesign
    new_string << ('1' * (@maze.width * 2 + 1))             # bottom row
    @maze.load(new_string)
    while !valid_maze?(@maze) do
      redesign
    end
  end

  ##
  #
  def middle_rows_redesign
    new_string = ''
    (1...(@maze.height * 2)).each do |n|                    # middle rows
      new_string << '1'                                     # left wall
      if n.odd?
        (1...(@maze.width * 2)).each { |m| new_string << (m.odd? ? '0' : ['0', '1'].sample) } # odd middle rows: empty space if odd, random wall or space if even
      else
        (1...(@maze.width * 2)).each { |d| new_string << (d.odd? ? ['0', '1'].sample : '1') } # even middle rows: random wall or space if odd, wall if even
      end
      new_string << '1'                                     # right wall
    end
    new_string
  end

  ##
  # Returns true if the given maze is a valid maze and false if not.
  def valid_maze?(maze)
    maze.cells.flatten.map { |cell| (1..3).include?(cell.connected_cells.length) }.all?
  end
end