# maze.rb
# Written by: Noranda Brown
# Version: 2014.2.3

require_relative 'cell'
require_relative 'maze_printer'

class Maze

  attr_reader :height, :width, :cells

  ##
  # Initializes a maze with the given height and width, or 3x3 by default, and 4 wall cells.
  def initialize(height = 3, width = 3)
    @height = height.to_i
    @width = width.to_i
    @cells = []
    #(0..(height * width) - 1).each { |n| @cells << Cell.new(n % width, n.to_i / width.to_int) }
    (0...@height * @width).each do |n|
      @cells[n / @width] ||= []
      @cells[n / @width][n % @width] = Cell.new(n % @width, n / @width)
    end
  end

  ##
  # Initializes a maze with the given string argument of 0's (for spaces) and 1's (for walls).
  def load(string_maze)


  end

  ##
  # Prints a diagram of the maze to the console.
  def display
    mp = MazePrinter.new(self)
    mp.print_maze
  end

  ##
  # Determines if there is a way to walk from a specified beginning position to a specified ending position. Returns
  # true if the maze is solvable and false if not.
  def solve(begX, begY, endX, endY)

  end

  ##
  # Traces the solution to a maze by returning the positions that the solution visits.
  def trace(begX, begY, endX, endY)

  end

  ##
  # Resets all of the cells and walls and comes up with a random new maze of the same size.
  def redesign

  end

  ##
  # Returns the top left corner index of a given cell.
  def left_corner(cell)
    (@width * 2 + 1) * (2 * cell.y) + (2 * cell.x)
  end
end