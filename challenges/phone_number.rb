# My original answer

class PhoneNumber
  def initialize(number)
    @number = number
  end

  def number
    @numbers = @number.gsub(/[().-]/, ' ').delete(' ').chars
    return '0000000000' if !!invalid
    @numbers.delete_at(0) if @numbers[0] == '1' && @numbers.size == 11
    @numbers.join
  end

  def invalid
    @number =~ /[a-z]/i ||
    @numbers.size < 10 ||
    @numbers.size == 11 && @numbers[0] != '1' ||
    @numbers.size > 11
  end

  def area_code
    numbers = number
    numbers[0..2]
  end

  def to_s
    numbers = number
    "(#{numbers[0..2]}) #{numbers[3..5]}-#{numbers[6..9]}"
  end
end

# My refactored version

class PhoneNumber
  def initialize(number)
    @number = number
  end

  def number
    @numbers = @number.gsub(/[ ().-]/, '').chars
    return '0000000000' if !!invalid
    @numbers.delete_at(0) if @numbers[0] == '1' && @numbers.size == 11
    @numbers.join
  end

  def invalid
    @number =~ /[a-z]/i ||
    @numbers.size < 10 ||
    @numbers.size == 11 && @numbers[0] != '1' ||
    @numbers.size > 11
  end

  def area_code
    @number[0..2]
  end

  def to_s
    numbers = number
    "(#{numbers[0..2]}) #{numbers[3..5]}-#{numbers[6..9]}"
  end
end
