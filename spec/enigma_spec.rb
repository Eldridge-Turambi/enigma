require 'spec_helper'
require 'simplecov'
require './lib/enigma'


RSpec.describe Enigma do

  it 'exists' do
    enigma1 = Enigma.new

    expect(enigma1).to be_an_instance_of(Enigma)
  end
end
