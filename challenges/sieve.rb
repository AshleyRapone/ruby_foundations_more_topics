# My original answer

class Sieve
  attr_reader :prime_numbers, :numbers

  def initialize(num)
    @num = num
    @numbers = (2..num).to_a
    @prime_numbers = {}
    numbers.each do |n|
      prime_numbers[n] = 'unmarked'
    end
  end

  def prime?(num)
    (2..(num - 1)).each do |divisor|
      return false if num % divisor == 0
    end
    true
  end

  def multiples_of_prime(num)
    results = []
    (2..num).each do |multiple|
      results << multiple if num % multiple == 0
    end
    results
  end

  def primes
    numbers.each do |num|
      if prime_numbers[num] == 'unmarked' && prime?(num)
        results = multiples_of_prime(num)
        results.each do |number|
          prime_numbers[number] = 'marked'
        end
      end
    end
    result = prime_numbers.select do |key, value|
      key if value == 'marked'
    end
    result.keys
  end
end

# Refactored version after viewing a submitted solution

class Sieve
  attr_reader :numbers

  def initialize(num)
    @numbers = (2..num).to_a
  end

  def primes
    numbers.each do |number|
      numbers.reject! { |n| (n % number == 0) && (n != number) }
    end
    numbers
  end
end

# The above method iterates through the numbers array and for each number
# If each number in the numbers array can be divided evenly into the current number in iteration (is a multiple of the
# number) and isnt equal to the number then delete it from the array.
# At the end we have the numbers array which is left with all prime numbers
