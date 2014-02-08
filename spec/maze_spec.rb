# maze_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require 'spec_helper'

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
    it 'can print a basic 3 x 3 maze' do
      $stdout.should_receive(:puts).with("+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n\n")
      Maze.new.display
    end
  end

  context '#solve' do
    it 'returns false if a maze cannot be solved' do
      m = Maze.new
      expect(m.solve(0, 0, 2, 2)).to eq(false)
    end

    it 'returns true if a maze can be solved' do
      m = Maze.new(4, 4)
      m.load('11111111110001000111101010110001010110111010110000010111101110110000010111111111')
      expect(m.solve(0, 0, 3, 3)).to eq(true)
    end
  end

  context '#trace' do
    it 'prints the trace of a solvable maze to the console' do
      $stdout.should_receive(:puts).with("+-+-+\n|X  |\n+-+ +\n| | |\n+-+-+\n\n")
      $stdout.should_receive(:puts).with("+-+-+\n|  X|\n+-+ +\n| | |\n+-+-+\n\n")
      $stdout.should_receive(:puts).with("+-+-+\n|   |\n+-+ +\n| |X|\n+-+-+\n\n")
      Maze.new(2, 2).load('1111110001111011010111111').trace(0, 0, 1, 1)
    end

    it 'prints "Maze not solvable" to the console for an unsolvable maze' do
      $stdout.should_receive(:puts).with('Maze not solvable.')
      Maze.new.trace(0, 0, 1, 1)
    end
  end

  context '#redesign' do
    it 'redesigns a maze to be a new random valid maze of the same size' do
      m = Maze.new(2, 2).load('1111110001111011010111111')
      m.redesign
      mg = MazeGenerator.new(m)
      expect(mg.send(:valid_maze?, m)).to eq(true)
    end
  end
end