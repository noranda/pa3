# cell.rb
# Written by: Noranda Brown
# Version: 2014.2.2

class Cell

  attr_accessor :x, :y, :walls

  ##
  # Initializes a cell object.
  def initialize(x, y, walls = [])
    @x = x
    @y = y
    @walls = walls
  end

  ##
  # Adds a wall to the cell.
  def add_wall(position)
    @walls << Wall.new(position)
  end

  ##
  # Returns the top left corner index of the cell given its x and y coordinates.
  def left_corner
    ()
  end

end