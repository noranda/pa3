# maze.rb
# Written by: Noranda Brown
# Version: 2014.2.7

require_relative 'cell'
require_relative 'maze_printer'
require_relative 'maze_solver'
require_relative 'maze_solver_cell'

class Maze

  attr_reader :height, :width, :cells

  ##
  # Initializes a maze with the given height and width, or 3x3 by default, and with 4 walled cells.
  def initialize(height = 3, width = 3)
    @height = height.to_i
    @width = width.to_i
    @cells = []
    (0...@height * @width).each do |n|
      @cells[n / @width] ||= []
      @cells[n / @width][n % @width] = Cell.new(n % @width, n / @width)
    end
  end

  ##
  # Loads a maze with the given string argument of 0's (for spaces) and 1's (for walls) and returns the maze.
  def load(string_maze)
    binary_array = string_maze.split('').map(&:to_i)
    @cells.each_with_index do |row, index_row|
      row.each_with_index do |cell, index_col|
        cell_index = get_cell_index(index_row, index_col)
        cell.connect_cells(@cells[index_row][index_col + 1]) if binary_array[cell_index + 1] == 0
        cell.connect_cells(@cells[index_row - 1][index_col]) if binary_array[cell_index - (@width * 2 + 1)] == 0
      end
    end
    self
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
    result = maze_solver(begX, begY, endX, endY)
    return result != false
  end

  ##
  # Traces the solution to a maze by returning the positions that the solution visits. Assumes solvable maze.
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

  end

  ##
  # Returns the cell index of a cell in a given row and col index.
  def get_cell_index(index_row, index_col)
    cell_row_index = @width * 2 * (index_row * 2 + 1)
    offset =  (index_row * 2 + 2) + (index_col * 2)
    cell_row_index + offset
  end

  private

  ##
  # Returns a solved path array if the maze is solvable or false if not.
  def maze_solver(begX, begY, endX, endY)
    start_cell = @cells[begY][begX]
    end_cell = @cells[endY][endX]
    ms = MazeSolver.new(self)
    ms.solve(start_cell, end_cell)
  end
end