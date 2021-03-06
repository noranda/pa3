# maze_solver_cell.rb
# Written by: Noranda Brown
# Version: 2014.2.8

class MazeSolverCell

  attr_reader :cell, :parent

  ##
  # Initializes a maze solver cell that includes a cell and its parent cell's MazeSolverCell object.
  def initialize(cell, parent)
    @cell = cell        # MazeCell object
    @parent = parent    # MazeSolverCell object
  end
end