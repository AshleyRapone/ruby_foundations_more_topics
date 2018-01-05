# My original answer

class Octal
  def initialize(string)
    @octal_string = string
    @octal_size = @octal_string.size
  end

  def to_decimal
    return 0 if @octal_string =~ /[a-zA-z]/ || @octal_string =~ /[8-9]/
    sum = 0
    counter = 0
    digits = @octal_string.chars.map(&:to_i)

    while @octal_size > 0
      sum += digits[@octal_size - 1] * (8 ** counter)
      @octal_size -= 1
      counter += 1
    end
    sum
  end
end

# Refactored version after viewing a submitted solution

class Octal
  attr_reader :octal_string

  def initialize(string)
    @octal_string = string
  end

  def to_decimal
    return 0 if octal_string =~ /\D|[8-9]/

    digits = octal_string.chars.map(&:to_i)
    decimal = 0
    digits.reverse.each_with_index do |num, index|
      decimal += num * (8 ** index)
    end
    decimal
  end
end
