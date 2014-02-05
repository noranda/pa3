# maze_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.5

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
    it 'can load in a maze from a string representation' do
      $stdout.should_receive(:puts).with("+-+-+-+-+\n|   |   |\n+-+ + + +\n|   | | |\n+ +-+ + +\n|     | |\n+-+ +-+ +\n|     | |\n+-+-+-+-+\n\n")
      m = Maze.new(4, 4)
      m.load('11111111110001000111101010110001010110111010110000010111101110110000010111111111')
      m.display
    end
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

  context '#get_cell_index' do
    it 'can get the cell index from the string representation for a cell' do
      m = Maze.new
      expect(m.get_cell_index(1, 1)).to eq(24)
    end
  end
end