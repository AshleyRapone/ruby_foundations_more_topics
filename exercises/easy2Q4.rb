def count(num1=nil, num2=nil, num3=nil)
  counter = 0
  results = []
  sum = 0
  array = [num1, num2, num3]
  return 0 if array.include?(nil)
  while counter < array.size
    results << yield(array[counter])
    counter += 1
  end

  results.each do |result|
    sum += 1 if result
  end
  sum
end


p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
