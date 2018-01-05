# my original answer

class Series
  attr_reader :string_of_digits

  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(num)
    raise ArgumentError if string_of_digits.length < num
    results = []
    counter1 = 0
    counter2 = (num - 1)
    numbers = string_of_digits.chars.map(&:to_i)
    while string_of_digits.length > counter2
      results << numbers[counter1..counter2]
      counter1 += 1
      counter2 += 1
    end
    results
  end
end

# Refactored version after viewing a submitted solution

class Series
  attr_reader :string_of_digits

  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(num)
    raise ArgumentError if string_of_digits.length < num
    numbers = string_of_digits.chars.map(&:to_i)
    numbers.each_cons(num).to_a
  end
end
