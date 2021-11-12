require 'spec_helper'
require 'simplecov'
require './lib/enigma'


RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end

  ##Check to see if these assertions are appropriate
  it '#random_five_digit_string' do
    expect(@enigma.random_five_digit_string).to be_a(String)
    expect(@enigma.random_five_digit_string.split(//).count).to eq(5)
  end

  ## Check the second Assertion
  it '#todays_date' do
    expect(@enigma.todays_date).to be_a(String)
    expect(@enigma.todays_date).to eq(Time.now.strftime('%d%m%y'))
  end

  it '#the_keys' do
    expect(@enigma.the_keys).to be_a(Array)
  end

  xit '#encrypt' do
    expect(@enigma.encrypt('hello world', '02715', '040895')).to be_a(Hash)
  end
end
