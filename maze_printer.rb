# maze_printer.rb
# Written by: Noranda Brown
# Version: 2014.2.8

class MazePrinter

  ##
  # Initializes a MazePrinter object with the given maze and an optional cell to print an 'X' in.
  def initialize(maze, cell = nil)
    @maze = maze
    @maze_string = ''
    @cell = cell
  end

  ##
  # Prints the maze to the console.
  def print_maze
    add_rows
    (0...@maze.width).each do |n|
      @maze_string << '+-'
    end
    @maze_string << "+\n\n"
    puts @maze_string
  end

  private #########################################################################!

  ##
  # Adds the rows of the maze to print to the maze string. Used with print_maze.
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
  # Returns a space if @cell = nil and an X if not. Used with add_rows.
  def cell_marker(row_index, col_index)
    if !@cell.nil? && @cell.x == col_index && @cell.y == row_index
      'X'
    else
      ' '
    end
  end

  ##
  # Prints the trace of the given maze and trace array to the console.
  def self.print_trace(maze, trace_array)
    trace_array.reverse.each do |cell|
      mp = MazePrinter.new(maze, cell)
      mp.print_maze
    end
  end
end