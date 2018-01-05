# My original answer

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(end_number)
    results = []
    (1..(end_number - 1)). each do |num|
      results << num if num % 3 == 0 || num % 5 == 0
    end
    return 0 if results.size == 0
    results.reduce(:+)
  end

  def to(end_number)
    results = []
    (1..(end_number - 1)). each do |num|
      results << num if multiple? num
    end
    results.reduce(:+)
  end

 private

  def multiple?(number)
    multiples.any? { |multiple| number % multiple == 0 }
  end
end

# Refactored version after viewing a submitted solution

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(end_number)
    SumOfMultiples.new(3, 5).to end_number
  end

  def to(end_number)
    results = []
    (1..(end_number - 1)). each do |num|
      results << num if multiple? num
    end
    return 0 if results.size == 0
    results.reduce(:+)
  end

 private

  def multiple?(number)
    multiples.any? { |multiple| number % multiple == 0 }
  end
end
