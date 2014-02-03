# cell_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'
require_relative '../wall'

describe Cell do

  context '#initialize' do
    it 'can be constructed with 2 arguments' do
      expect { Cell.new(3, 3) }.to_not raise_error
    end

    it 'can be constructed with 3 arguments' do
      expect { Cell.new(3, 3, ['top', 'left']) }.to_not raise_error
    end
  end
end