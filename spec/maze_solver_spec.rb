# maze_solver_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.7

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'
require_relative '../maze_printer'
require_relative '../maze_solver'

describe MazeSolver do

  context '#initialize' do
    it 'can be constructed' do
      expect { MazeSolver.new(Maze.new) }.to_not raise_error
    end
  end

  context '#solve' do
    it 'returns an array if a maze is solvable' do
      maze = Maze.new(2, 2).load('1111110001111011010111111')
      ms = MazeSolver.new(maze)
      expect(ms.solve(maze.cells[0][0], maze.cells[1][1])).to be_kind_of(Array)
    end

    it 'returns false if a maze is not solvable' do
      maze = Maze.new(2, 2).load('1111110001111111010111111')
      ms = MazeSolver.new(maze)
      expect(ms.solve(maze.cells[0][0], maze.cells[1][1])).to eq(false)
    end
  end
end