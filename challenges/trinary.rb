# My original answer

class Trinary
  attr_reader :string_of_numbers

  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def to_decimal
    return 0 if string_of_numbers =~ /[^012]/
    sum = 0
    counter = 0
    size = string_of_numbers.size
    numbers = string_of_numbers.chars.map(&:to_i)

    while size > 0
      sum += numbers[size - 1] * (3 ** counter)
      size -= 1
      counter += 1
    end
    sum
  end
end

# Refactored version after viewing a submitted solution

class Trinary
  attr_reader :string_of_numbers

  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def to_decimal
    return 0 if string_of_numbers =~ /[^012]/

    digits = string_of_numbers.chars.map(&:to_i)
    decimal = 0
    digits.reverse.each_with_index do |num, index|
      decimal += num * (3 ** index)
    end
    decimal
  end
end
