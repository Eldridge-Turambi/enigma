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
    expect(@enigma.the_keys('02715')).to be_a(Array)
    expect(@enigma.the_keys('02715')).to eq([02, 27, 71, 15])
  end

  it '#the_offsets' do
    expect(@enigma.the_offsets('040895')).to be_a(Array)
    expect(@enigma.the_offsets('040895')).to eq([1, 0, 2, 5])
  end

  it '#the_shifts' do
    expect(@enigma.the_shifts([34, 44, 46, 67], [6, 6, 4, 1])).to be_a(Array)
    expect(@enigma.the_shifts([02, 27, 71, 15], [1, 0, 2, 5])).to eq([3, 27, 73, 20])
  end

  it '#encrypt' do
    expect(@enigma.encrypt('hello world', '02715', '040895')).to be_a(Hash)
    expect(@enigma.encrypt("hello world", "02715")).to be_a(Hash)
    expect(@enigma.encrypt('Hello world!', '02715', '040895')).to eq({:date=>"040895", :encryption=>"keder ohulw!", :key=>"02715"})
    expect(@enigma.encrypt("hello world", "02715")).to eq({:date=>"151121", :encryption=>"pkfawfqdzry", :key=>"02715"})
    ##This is hard to test because of the randomness
    # expect(@enigma.encrypt("hello world")).to eq({:date=>"141121", :encryption=>"qnstxicw uk", :key=>"03034"})

  end

  it '#decrypt' do
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to be_a(Hash)
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
    expect(@enigma.decrypt('pkfawfqdzry', "02715", '151121')).to eq({:date=>"151121", :decryption=>"hello world", :key=>"02715"})
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq({:date=>"151121", :decryption=>"hello world", :key=>"02715"})
    expect(@enigma.decrypt('Keder Ohulw!', '02715', '040895')).to eq({:date=>"040895", :decryption=>"hello world!", :key=>"02715"})

  end

end
