# maze_solver.rb
# Written by: Noranda Brown
# Version: 2014.2.8

class MazeSolver

  attr_reader :cells_to_visit, :cells_visited, :solved_path, :maze

  ##
  # Initializes a MazeSolver object with the given maze.
  def initialize(maze)
    @cells_to_visit = []
    @cells_visited = []
    @solved_path = []
    @maze = maze
  end

  ##
  # Solves a maze given a start and end cell. Returns the solved path if the maze is solvable and false if not.
  def solve(start_cell, end_cell)
    @cells_to_visit << start_cell
    result = trace(start_cell, end_cell)    # returns true if maze is solvable and false if not
    if result == true
      return find_path                      # if solvable, returns the solved path
    end
    return false                            # if not solvable, returns false
  end

  private ##############################################################

  ##
  # Traces a maze recursively. Used in solve.
  def trace(start_cell, end_cell)
    if start_cell == end_cell                                                   # reached the end, returns true
      @cells_visited << MazeSolverCell.new(start_cell, parent_cell(start_cell))
      return true
    elsif @cells_to_visit.length == 0                                           # no more cells to visit, returns false
      return false
    else
      @cells_visited << MazeSolverCell.new(start_cell, parent_cell(start_cell)) # add start cell with parent to list of cells visited
      @cells_to_visit.delete(start_cell)                                        # delete the start cell from cells to visit list
      add_connections(start_cell, end_cell)                                     # add connected cells to cells to visit list
      trace(@cells_to_visit.first, end_cell)                                    # recursive call
    end
  end

  ##
  # Returns the parent cell of a cell. A cell is a parent cell to a child cell if it is in the cells visited list and id
  # connected to the child cell. Used in trace.
  def parent_cell(child_cell)
    if @cells_visited.empty?
      return nil
    else
      @cells_visited.select { |cell| child_cell.connected_cells.include?(cell.cell) }.first
    end
  end

  ##
  # Adds the connections of the start cell to the cells to visit list and sorts by shortest distance unless it has
  # already been visited. Used in trace.
  def add_connections(start_cell, end_cell)
    start_cell.connected_cells.each do |cell|
      (@cells_to_visit << cell).sort_by! { |cell| cell.distance_to(end_cell) } unless cell_array_visited.include?(cell)
    end
  end

  ##
  # Returns an array of cell objects in the cells visited list. Used in add_connections.
  def cell_array_visited
    cell_array = []
    @cells_visited.map { |ms_cell| cell_array << ms_cell.cell }
    cell_array
  end

  ##
  #  Updates the solved_path instance variable to show the path. Assumes the maze is solvable. Used in solve.
  def find_path
    current_node = @cells_visited.last
    while current_node.parent != nil do
      @solved_path << current_node.cell
      current_node = current_node.parent
    end
    @solved_path << current_node.cell
  end
end