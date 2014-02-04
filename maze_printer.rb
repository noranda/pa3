# maze_printer.rb
# Written by: Noranda Brown
# Version: 2014.2.3

class MazePrinter

  def initialize(maze)
    @maze = maze
    @maze_string = ''
  end

  def print_maze
    add_rows
    (0...@maze.width).each do |n|
      @maze_string << '+-'
    end
    @maze_string << "+\n\n"
    puts @maze_string
  end

  def add_rows
    @maze.cells.map do |row|
      (0...row.length).each do |n|
        @maze_string << '+' << (row[n].has_top_cell? ? ' ' : '-')
      end
      @maze_string << "+\n"
      (0...row.length).each do |n|
        @maze_string << (row[n].has_left_cell? ? ' ' : '|') << ' '
      end
      @maze_string << "|\n"
    end
  end
end