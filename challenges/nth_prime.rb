# My original answer

class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    numbers = (2..100).to_a
    primes = []
    numbers.each do |number|
      primes << number if self.prime?(number)
    end
    primes[num - 1]
  end

  def self.prime?(num)
    (2..(num - 1)).each do |divisor|
      return false if num % divisor == 0
    end
    true
  end
end

# Refactored version after viewing a submitted solution

class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    number = 2
    primes = []
    until primes.size == num
      primes << number if prime?(number)
      number += 1
    end
    primes.last
  end

  def self.prime?(num)
    (2..(Math.sqrt(num))).each do |divisor|
      return false if num % divisor == 0
    end
    true
  end
end
