# wall.rb
# Written by: Noranda Brown
# Version: 2014.2.2

class Wall

  attr_accessor :position

  ##
  # Initializes a wall with a given position (left, right, top, or bottom).
  def initialize(position)
    @position = position
  end
end