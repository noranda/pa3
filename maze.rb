# maze.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require_relative 'cell'
require_relative 'wall'

class Maze

  attr_reader :height, :width

  ##
  # Initializes a maze with the given height and width, or 3x3 by default.
  def initialize(height = 3, width = 3)
    @height = height
    @width = width
  end

  ##
  # Initializes a maze with the given string argument of 0's (for spaces) and 1's (for walls).
  def load(string_maze)


  end

  ##
  # Prints a diagram of the maze to the console.
  def display

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
end