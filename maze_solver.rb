# maze_solver.rb
# Written by: Noranda Brown
# Version: 2014.2.5

class MazeSolver

  attr_accessor :cells_to_visit, :cells_visited, :solved_path, :maze

  ##
  # Initializes a MazeSolver object with the given maze.
  def initialize(maze)
    @cells_to_visit = []
    @cells_visited = []
    @solved_path = []
    @maze = maze
  end

  ##
  # Solves a maze given a start and end cell.
  def solve(start_cell, end_cell)
    @cells_to_visit << start_cell
    trace(start_cell, end_cell)
  end

  private

  ##
  # Used in solving a maze.
  def trace(start_cell, end_cell)
    if start_cell == end_cell
      return true
    elsif @cells_to_visit.length == 0
      return false
    else
      @cells_visited << MazeSolverCell.new(start_cell, @cells_visited.last) # add start cell with parent to list of cells visited
      @cells_to_visit.delete(start_cell)                                    # delete the start cell from cells to visit
      add_connections(start_cell, end_cell)
      trace(@cells_to_visit.first, end_cell)   # recursive call
    end
  end

  ##
  # Add the connections of a cell to the cells to visit list and sorts by shortest distance unless it has already been visited.
  def add_connections(start_cell, end_cell)
    start_cell.connected_cells.each do |cell|                             # for each connected cell to the start cell
      (@cells_to_visit << cell).sort_by! { |cell| cell.distance_to(end_cell) } unless cell_array_visited.include?(cell)
    end
  end

  ##
  # Returns an array of cell objects in the cells visited list.
  def cell_array_visited
    cell_array = []
    @cells_visited.map { |ms_cell| cell_array << ms_cell.cell }
    cell_array
  end
end