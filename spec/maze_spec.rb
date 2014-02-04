# maze_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'

describe Maze do

  context '#initialize' do
    it 'can be constructed with 2 arguments' do
      expect { Maze.new(3, 3) }.to_not raise_error
    end

    it 'can be constructed with 0 arguments' do
      expect { Maze.new }.to_not raise_error
    end
  end

  context '#load' do

  end

  context '#display' do
    it 'can print a basic 3x3 maze' do
      $stdout.should_receive(:puts).with("+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n\n")
      Maze.new.display
    end
  end

  context '#solve' do

  end

  context '#trace' do

  end

  context '#redesign' do
    
  end

  context '#add_cell' do
    it 'adds a cell to an empty maze' do
      test_cell = Cell.new(1, 2)
      test_maze = Maze.new(3, 3)
      expect test_maze.add_cell(test_cell).to_not raise_error
    end
  end

  context '#left_corner' do
    it 'returns the left corner index of a cell' do
      test_cell = Cell.new(1, 2)
      test_maze = Maze.new(3, 3)
      expect test_maze.left_corner(test_cell).to eq(30)
    end
  end
end