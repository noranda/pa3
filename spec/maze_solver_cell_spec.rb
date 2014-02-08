# maze_solver_cell_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require 'spec_helper'
require_relative '../maze'

describe MazeSolverCell do

  context '#initialize' do
    it 'can be constructed' do
      cell_1 = MazeCell.new(0, 0)
      cell_2 = MazeCell.new(1, 0)
      expect { MazeSolverCell.new(cell_1, MazeSolverCell.new(cell_2, nil)) }.to_not raise_error
    end
  end
end