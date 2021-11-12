class Enigma

  def initialize

  end

  def random_five_digit_string
    numbers_array = (0..99999).to_a
    random_number = numbers_array.sample
    random_number.to_s.rjust(5, '0')
  end

  def todays_date
    Time.now.strftime('%d%m%y')
  end

  def the_keys
    x = random_five_digit_string.chars
    a_key = x[0] + x[1]
    b_key = x[1] + x[2]
    c_key = x[2] + x[3]
    d_key = x[3] + x[4]
    [a_key, b_key, c_key, d_key]
  end
end
