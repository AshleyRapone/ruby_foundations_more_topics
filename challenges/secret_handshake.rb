# My original answer

class SecretHandshake
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def commands
    return [] if invalid_input?(number) == true
    current_number = binary_to_number(number) if number.class == String

    results = []
    reverse = false
    current_number = number
    while current_number > 0
      case current_number
        when 1
          results << 'wink'
          current_number -= 1
        when (2..3)
          results << 'double blink'
          current_number -= 2
        when (4..7)
          results << 'close your eyes'
          current_number -= 4
        when (8..15)
          results << 'jump'
          current_number -= 8
        when (16..100)
        reverse = true
        current_number -= 16
      end
    end
    return results.reverse.reverse if reverse == true
    results.reverse
  end

  def invalid_input?(number)
    !!(number =~ /[a-zA-Z]/)
  end

  def binary_to_number(number)
    sum = 0
    counter = 0
    counter2 = number.size
    while counter < number.size
      sum += (2 ** counter) if number[counter2 - 1] == '1'
      counter2 -= 1
      counter += 1
    end
    @number = sum
  end
end

# Refactored version after viewing a submitted solution

class SecretHandshake
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def commands
    return [] if invalid_input?(number) == true
    current_number = binary_to_number(number) if number.class == String

    results = []
    reverse = false
    current_number = number
    while current_number > 0
      case current_number
        when 1
          results << 'wink'
          current_number -= 1
        when (2..3)
          results << 'double blink'
          current_number -= 2
        when (4..7)
          results << 'close your eyes'
          current_number -= 4
        when (8..15)
          results << 'jump'
          current_number -= 8
        when (16..100)
        reverse = true
        current_number -= 16
      end
    end
    return results.reverse.reverse if reverse == true
    results.reverse
  end

  def invalid_input?(number)
    !!(number =~ /[a-zA-Z]/)
  end

  def binary_to_number(number)
    sum = 0
    counter = 0
    number.chars.reverse.each do |num|
      sum += (2 ** counter) if num[counter] == '1'
      counter += 1
    end
    @number = sum
  end
end
