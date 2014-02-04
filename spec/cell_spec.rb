# cell_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'

describe Cell do

  context '#initialize' do
    it 'can be constructed with 2 arguments' do
      expect { Cell.new(3, 3) }.to_not raise_error
    end
  end
end