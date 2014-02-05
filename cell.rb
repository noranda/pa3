# cell.rb
# Written by: Noranda Brown
# Version: 2014.2.5

class Cell

  attr_accessor :x, :y, :connected_cells

  ##
  # Initializes a cell object.
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
  # Returns true if the cell has a connected cell to the right and false otherwise.
  def has_right_cell?
    result = @connected_cells.select { |cell| cell.x == @x + 1 && cell.y == @y }
    !result.empty?
  end

  ##
  # Returns true if the cell has a connected cell to the bottom and false otherwise.
  def has_bottom_cell?
    result = @connected_cells.select { |cell| cell.x == @x && cell.y == @y + 1 }
    !result.empty?
  end

  ##
  # Returns true if the cell has a connected cell to the left and false otherwise.
  def has_left_cell?
    result = @connected_cells.select { |cell| cell.x == @x - 1 && cell.y == @y }
    !result.empty?
  end

  ##
  # Connects the cell to it's right cell and it's right cell to the cell. Assumes there
  # is a cell to the right and that it is connected.
  def connect_right_cell(right_cell)
    cell.connected_cells << right_cell
    right_cell.connected_cells << cell
  end

  ##
  # Connects the given cell to it's top cell and it's top cell to the cell. Assumes there
  # is a cell to the top and that it is connected.
  def connect_top_cell(top_cell)
    cell.connected_cells << top_cell
    top_cell.connected_cells << cell
  end
end