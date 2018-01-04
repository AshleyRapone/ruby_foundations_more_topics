def none?(array)
  counter = 0
  results = []
  while counter < array.size
    result = yield(array[counter])
    results << result
    counter += 1
  end
  results.count(false) == array.size
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true

# other answer I came up with 

def none?(array)
  results = []
  array.each do |item|
    results << yield(item)
  end
  results.count(true) == 0
end
