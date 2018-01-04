def missing(array)
  return [] if array.size == 1
  sorted_array = array.sort
  min = sorted_array.min
  max = sorted_array.max
  result = []

  (min..max).each do |num|
    result << num unless sorted_array.include?(num)
  end
  result
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

=begin
sort array
get min value
get max value

result = []

(min..max).each do |num|
  result << num unless array.include?(num)
end

=end
