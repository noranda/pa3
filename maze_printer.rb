# maze_printer.rb
# Written by: Noranda Brown
# Version: 2014.2.7

class MazePrinter

  def initialize(maze, cell = nil)
    @maze = maze
    @maze_string = ''
    @cell = cell
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
    @maze.cells.each_with_index do |row, row_index|
      (0...row.length).each do |col_index|
        @maze_string << '+' << (row[col_index].has_top_cell? ? ' ' : '-')
      end
      @maze_string << "+\n"
      (0...row.length).each do |col_index|
        @maze_string << (row[col_index].has_left_cell? ? ' ' : '|') << cell_marker(row_index, col_index)
      end
      @maze_string << "|\n"
    end
  end

  ##
  # Returns a space if @cell = nil and an X if not.
  def cell_marker(row_index, col_index)
    if !@cell.nil? && @cell.x == col_index && @cell.y == row_index
      'X'
    else
      ' '
    end
  end

  def self.print_trace(maze, trace_array)
    trace_array.reverse.each do |cell|
      mp = MazePrinter.new(maze, cell)
      mp.print_maze
    end
  end
end