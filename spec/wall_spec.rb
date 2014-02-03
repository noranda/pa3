# wall_spec.rb
# Written by: Noranda Brown
# Version: 2014.2.2

require 'spec_helper'
require_relative '../maze'
require_relative '../cell'
require_relative '../wall'

describe Wall do

  context '#initialize' do
    it 'can be constructed' do
      expect { Wall.new('top') }.to_not raise_error
    end
  end
end