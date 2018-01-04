def count(array)
  counter = 0
  results = []
  sum = 0
  while counter < array.size
    result = yield(array[counter])
    results << result
    counter += 1
  end
  results.each do |result|
    sum += 1 if result == true
  end
  sum
end


puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2


# Another answer I came up with

def count(array)
  sum = 0
  array.each do |item|
    sum += 1 if yield(item)
  end
  sum
end
