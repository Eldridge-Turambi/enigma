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

  it '#random_five_digit_string' do
    expect(@enigma.random_five_digit_string).to be_a(String)
    expect(@enigma.random_five_digit_string.split(//).count).to eq(5)
  end

  it '#todays_date' do
    expect(@enigma.todays_date).to be_a(String)
    expect(@enigma.todays_date).to eq(Time.now.strftime('%d%m%y'))
  end

  xit '#encrypt' do
    expect(@enigma.encrypt('hello world', '02715', '040895')).to be_a(Hash)
  end
end
