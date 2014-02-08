# maze_generator.rb
# Written by: Noranda Brown
# Version: 2014.2.8

class MazeGenerator

  attr_reader :maze

  ##
  # Initializes a MazeGenerator object with the given maze.
  def initialize(maze)
    @maze = maze
  end

  ##
  # Resets all of the cells and walls and comes up with a random new maze of the same size. Recursively creates mazes
  # until a valid maze is created. Assumes a maze with < 50 cells.
  def redesign
    new_string = ''
    new_string << ('1' * (@maze.width * 2 + 1))             # top row
    new_string << middle_rows_redesign                      # middle rows
    new_string << ('1' * (@maze.width * 2 + 1))             # bottom row
    @maze.load(new_string)
    while !valid_maze?(@maze) do                            # while not a valid maze, recursively call
      redesign
    end
  end

  private #########################################################################

  ##
  # Returns a string representation of the middle rows of a redesigned maze. Used in redesign.
  def middle_rows_redesign
    new_string = ''
    (1...(@maze.height * 2)).each do |n|            # middle rows
      new_string << '1'                             # left wall
      if n.odd?                                     # odd middle rows: empty space if odd, random wall or space if even
        (1...(@maze.width * 2)).each { |m| new_string << (m.odd? ? '0' : ['0', '1'].sample) }
      else                                          # even middle rows: random wall or space if odd, wall if even
        (1...(@maze.width * 2)).each { |d| new_string << (d.odd? ? ['0', '1'].sample : '1') }
      end
      new_string << '1'                             # right wall
    end
    new_string
  end

  ##
  # Returns true if the given maze is a valid maze (has 1 - 3 connecting cells) and false if not. Used in redesign.
  def valid_maze?(maze)
    maze.cells.flatten.map { |cell| (1..3).include?(cell.connected_cells.length) }.all?
  end
end