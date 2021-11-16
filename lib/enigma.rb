class Enigma

  def initialize
    @alphabet = ("a" .. "z").to_a << " "
  end

  def random_five_digit_string
    numbers_array = (0..99999).to_a
    random_number = numbers_array.sample
    random_number.to_s.rjust(5, '0')
  end

  def todays_date
    Time.now.strftime('%d%m%y')
  end

  def the_keys(number_string)
    x = number_string.chars
    a_key = (x[0] + x[1]).to_i
    b_key = (x[1] + x[2]).to_i
    c_key = (x[2] + x[3]).to_i
    d_key = (x[3] + x[4]).to_i
    [a_key, b_key, c_key, d_key]
  end

  def the_offsets(date)
    selected_offsets = (date.to_i ** 2).to_s[-4..-1].chars
    offset_integers = selected_offsets.map do |offset|
      offset.to_i
    end
    offset_integers
  end

  def the_shifts(keys, offsets)
    x = keys
    y = offsets
    a_shift = x[0] + y[0]
    b_shift = x[1] + y[1]
    c_shift = x[2] + y[2]
    d_shift = x[3] + y[3]
    [a_shift, b_shift, c_shift, d_shift]
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
