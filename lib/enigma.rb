require_relative '../lib/enigma_module'

class Enigma
  include Shifts

  def initialize
    @alphabet = ("a" .. "z").to_a << " "
  end

  def encrypt(message, key = random_five_digit_string, date = todays_date)
    result = Hash.new(0)
    formatted_key = the_keys(key)
    formatted_date = the_offsets(date)
    shifts = the_shifts(formatted_key, formatted_date)
    message_array = message.chars.map { |letter| letter.downcase }
    encrypted_message = []
    message_array.each_with_index do |letter, i|
      variable = i % 4
      if @alphabet.include?(letter) == true
        encrypted_message << @alphabet.rotate(shifts[variable])[@alphabet.index(letter)]
      elsif @alphabet.include?(letter) == false
        encrypted_message << letter
      end
    end
    result[:encryption] = encrypted_message.join
    result[:key] = key
    result[:date] = date
    result
  end

  def decrypt(message, key = random_five_digit_string, date = todays_date)
    result = Hash.new(0)
    formatted_key = the_keys(key)
    formatted_date = the_offsets(date)
    shifts = the_shifts(formatted_key, formatted_date)
    message_array = message.chars.map { |letter| letter.downcase }
    decrypted_message = []
    message_array.each_with_index do |letter, i|
      variable = i % 4
      if @alphabet.include?(letter) == true
        decrypted_message << @alphabet.rotate((shifts[variable]) * -1)[@alphabet.index(letter)]
      elsif @alphabet.include?(letter) == false
        decrypted_message << letter
      end
    end
    result[:decryption] = decrypted_message.join
    result[:key] = key
    result[:date] = date
    result
  end
end
