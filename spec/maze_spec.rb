# maze_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'
require_relative '../wall'

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

  end

  context '#solve' do

  end

  context '#trace' do

  end

  context '#redesign' do
    
  end
end