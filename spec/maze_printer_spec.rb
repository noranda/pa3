# maze_printer_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require 'spec_helper'
require_relative '../maze'

describe 'MazePrinter' do
  before do
    @maze = Maze.new
    @mp = MazePrinter.new(@maze)
  end

  context '#initialize' do
    it 'can be constructed with 1 argument' do
      expect { @mp }.to_not raise_error
    end

    it 'can be constructed with 2 arguments' do
      expect { MazePrinter.new(@maze, MazeCell.new(0, 0)) }.to_not raise_error
    end
  end

  context '#print_maze' do
    it 'prints a maze to the console' do
      $stdout.should_receive(:puts).with("+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n\n")
      @mp.print_maze
    end
  end
end