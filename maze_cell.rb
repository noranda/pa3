# maze_cell.rb
# Written by: Noranda Brown
# Version: 2014.2.8

class MazeCell

  attr_reader :x, :y, :connected_cells

  ##
  # Initializes a cell object with its x and y coordinates.
  def initialize(x, y)
    @x = x
    @y = y
    @connected_cells = []
  end

  ##
  # Returns true if the cell has a connected cell to the top and false otherwise.
  def has_top_cell?
    result = @connected_cells.select { |cell| cell.x == @x && cell.y == @y - 1 }
    !result.empty?
  end

  ##
  # Returns true if the cell has a connected cell to the left and false otherwise.
  def has_left_cell?
    result = @connected_cells.select { |cell| cell.x == @x - 1 && cell.y == @y }
    !result.empty?
  end

  ##
  # Connects the cell to the given cell and the given cell to the cell.
  def connect_cells(cell)
    @connected_cells << cell
    cell.connected_cells << self
  end

  ##
  # Returns the distance from the cell to the given cell.
  def distance_to(cell)
    (@x - cell.x).abs + (@y - cell.y).abs
  end
end