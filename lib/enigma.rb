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
end
