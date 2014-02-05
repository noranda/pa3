# cell_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.5

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'

describe Cell do

  context '#initialize' do
    it 'can be constructed with 2 arguments' do
      expect { Cell.new(3, 3) }.to_not raise_error
    end
  end

  context '#connect_cells' do
    before do
      @cell = Cell.new(1, 1)
      @given_cell = Cell.new(2, 1)
      @cell.connect_cells(@given_cell)
    end

    it 'can connect a cell to a given cell' do
      expect(@cell.connected_cells).to include(@given_cell)
    end

    it 'can connect a given cell to a cell' do
      expect(@given_cell.connected_cells).to include(@cell)
    end
  end
end