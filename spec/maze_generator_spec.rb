# maze_generator_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require 'spec_helper'

describe MazeGenerator do

  context '#initialize' do
    it 'can be constructed' do
      m = Maze.new
      expect { MazeGenerator.new(m) }.to_not raise_error
    end
  end

  context '#redesign' do
    it 'creates a random maze of the same size as the original' do
      m = Maze.new(2, 2).load('1111110001111011010111111')
      mg = MazeGenerator.new(m)
      mg.redesign
      expect(mg.send(:valid_maze?, m)).to eq(true)
    end
  end
end