# maze_cell_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.8

require 'spec_helper'
require_relative '../maze'

describe MazeCell do

  context '#initialize' do
    it 'can be constructed' do
      expect { MazeCell.new(3, 3) }.to_not raise_error
    end
  end

  context '#has_top_cell?' do
    before do
      @cell = MazeCell.new(1, 1)
      @top_cell = MazeCell.new(1, 0)
      @cell.connect_cells(@top_cell)
    end

    it 'returns true if the cell has a connected top cell' do
      expect(@cell.has_top_cell?).to eq(true)
    end

    it 'returns false if the cell does not have a connected top cell' do
      expect(@top_cell.has_top_cell?).to eq(false)
    end
  end

  context '#has_left_cell?' do
    before do
      @cell = MazeCell.new(1, 1)
      @left_cell = MazeCell.new(0, 1)
      @cell.connect_cells(@left_cell)
    end

    it 'returns true if the cell has a connected left cell' do
      expect(@cell.has_left_cell?).to eq(true)
    end

    it 'returns false if the cell does not have a connected left cell' do
      expect(@left_cell.has_left_cell?).to eq(false)
    end
  end

  context '#connect_cells' do
    before do
      @cell = MazeCell.new(1, 1)
      @given_cell = MazeCell.new(2, 1)
      @cell.connect_cells(@given_cell)
    end

    it 'can connect a cell to a given cell' do
      expect(@cell.connected_cells).to include(@given_cell)
    end

    it 'can connect a given cell to a cell' do
      expect(@given_cell.connected_cells).to include(@cell)
    end
  end

  context '#distance_to' do
    it 'returns the distance from a cell to the given cell' do
      cell_1 = MazeCell.new(0, 0)
      cell_2 = MazeCell.new(1, 2)
      expect(cell_1.distance_to(cell_2)).to eq(3)
    end
  end
end