# maze.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require_relative 'cell'
require_relative 'maze_printer'
require_relative 'maze_solver'
require_relative 'maze_solver_cell'
require_relative 'maze_generator'

class Maze

  attr_reader :height, :width, :cells

  ##
  # Initializes a maze with the given height and width, or 3 x 3 by default, and with 4 walled cells.
  def initialize(height = 3, width = 3)
    @height = height.to_i
    @width = width.to_i
    @cells = []
    initialize_cells
  end

  ##
  # Loads a maze with the given string argument of 0's (for spaces) and 1's (for walls) and returns the maze.
  # Assumes a valid string representation of a maze is given.
  def load(string_maze)
    initialize_cells                                              # resets cells to have no connecting cells
    binary_array = string_maze.split('').map(&:to_i)              # converts the string into an array of integers
    @cells.each_with_index do |row, index_row|                    # connects connecting cells to one another
      row.each_with_index do |cell, index_col|
        cell_index = get_cell_index(index_row, index_col)
        cell.connect_cells(@cells[index_row][index_col + 1]) if binary_array[cell_index + 1] == 0
        cell.connect_cells(@cells[index_row - 1][index_col]) if binary_array[cell_index - (@width * 2 + 1)] == 0
      end
    end
    self                                                          # returns the maze
  end

  ##
  # Prints a diagram of the maze to the console.
  def display
    mp = MazePrinter.new(self)
    mp.print_maze
  end

  ##
  # Determines if there is a way to walk from a specified beginning position to a specified ending position of the maze.
  # Returns true if the maze is solvable and false if not.
  def solve(begX, begY, endX, endY)
    result = maze_solver(begX, begY, endX, endY)
    return result != false
  end

  ##
  # Traces the solution to a maze by printing the positions that the solution visits to the console.
  def trace(begX, begY, endX, endY)
    result = maze_solver(begX, begY, endX, endY)
    if result == false
      puts "Maze not solvable."
    else
      # print maze tracer
      MazePrinter.print_trace(self, result)
    end
  end

  ##
  # Resets all of the cells and walls and comes up with a random new maze of the same size.
  def redesign
    MazeGenerator.new(self).redesign
  end

  private ###########################################################################################

  ##
  # Returns the cell index of a cell with a given row and column index.
  def get_cell_index(index_row, index_col)
    cell_row_index = @width * 2 * (index_row * 2 + 1)
    offset =  (index_row * 2 + 2) + (index_col * 2)
    cell_row_index + offset
  end

  ##
  # Returns a solved path array if the maze is solvable or false if not.
  def maze_solver(begX, begY, endX, endY)
    start_cell = @cells[begY][begX]
    end_cell = @cells[endY][endX]
    ms = MazeSolver.new(self)
    ms.solve(start_cell, end_cell)
  end

  ##
  # Initializes the cells of the maze to be a 2D array of 4-wall cells.
  def initialize_cells
    (0...@height * @width).each do |n|
      @cells[n / @width] ||= []
      @cells[n / @width][n % @width] = Cell.new(n % @width, n / @width)
    end
  end
end