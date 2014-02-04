# cell.rb
# Written by: Noranda Brown
# Version: 2014.2.2

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
end