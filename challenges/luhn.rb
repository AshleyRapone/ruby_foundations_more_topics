# My original answer

class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def checksum
    numbers = @number.to_s.chars.map(&:to_i)
    counter = @number.to_s.length
    results = []

    while counter > 0
      counter -= 1
      results << numbers[counter]
      break if counter == 0
      counter -= 1
      result = numbers[counter] * 2
      if result.to_s.length > 1
        results << (result - 9)
      else
        results << result
      end
    end
    @results = results
    @checksum = results.reduce(:+)
  end

  def valid?
    checksum
    @checksum.to_s.chars.map(&:to_i)[-1] % 10 == 0
  end

  def addends
    checksum
    @results.reverse
  end

  def self.create(numbers)
    digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    counter = 0
    return numbers if valid?(numbers) == true
    string_of_numbers = numbers.to_s
    loop do
      if valid?(string_of_numbers + digits[counter]) == true
        string_of_numbers << digits[counter]
        break
      end
      counter += 1
    end

    string_of_numbers.to_i
  end

  def self.valid?(numbers)
    digits = numbers.to_s.chars.map(&:to_i)
    counter = numbers.to_s.length
    results = []

    while counter > 0
      counter -= 1
      results << digits[counter]
      break if counter == 0
      counter -= 1
      result = digits[counter] * 2
      if result.to_s.length > 1
        results << (result - 9)
      else
        results << result
      end
    end

    checksum = results.reduce(:+)
    checksum.to_s.chars.map(&:to_i)[-1] % 10 == 0
  end
end

# Refactored version after viewing a submitted solution

class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def checksum
    numbers = @number.to_s.chars.map(&:to_i)
    counter = @number.to_s.length
    results = []

    while counter > 0
      counter -= 1
      results << numbers[counter]
      break if counter == 0
      counter -= 1
      result = numbers[counter] * 2
      if result.to_s.length > 1
        results << (result - 9)
      else
        results << result
      end
    end
    @results = results
    @checksum = results.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def addends
    checksum
    @results.reverse
  end

  def self.create(numbers)
    digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    counter = 0
    return numbers if valid?(numbers) == true
    string_of_numbers = numbers.to_s
    loop do
      if valid?(string_of_numbers + digits[counter]) == true
        string_of_numbers << digits[counter]
        break
      end
      counter += 1
    end

    string_of_numbers.to_i
  end

  def self.valid?(numbers)
    digits = numbers.to_s.chars.map(&:to_i)
    counter = numbers.to_s.length
    results = []

    while counter > 0
      counter -= 1
      results << digits[counter]
      break if counter == 0
      counter -= 1
      result = digits[counter] * 2
      if result.to_s.length > 1
        results << (result - 9)
      else
        results << result
      end
    end

    checksum = results.reduce(:+)
    checksum.to_s.chars.map(&:to_i)[-1] % 10 == 0
  end
end
