# My original answer

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0

    divisors = []
    (1..(num - 1)).each do |divisor|
      divisors << divisor if num % divisor == 0
    end

    sum_of_factors = divisors.reduce(:+)

    classify_number(sum_of_factors, num)
  end

  private

  def self.classify_number(sum_of_factors, num)
    if sum_of_factors > num
      'abundant'
    elsif sum_of_factors < num
      'deficient'
    else
      'perfect'
    end
  end
end

# Refactored version after viewing a submitted solution

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0

    divisors = (1..(num - 1)).select do |divisor|
      divisor if num % divisor == 0
    end

    sum_of_factors = divisors.reduce(:+)

    classify_number(sum_of_factors, num)
  end

  private

  def self.classify_number(sum_of_factors, num)
    if sum_of_factors > num
      'abundant'
    elsif sum_of_factors < num
      'deficient'
    else
      'perfect'
    end
  end
end
