require 'pry'
def max_by(array)
  return array[0] if array.size == 1
  counter = 0
  results = []
  while counter < array.size
    results << yield(array[counter])
    counter += 1
  end
  current = results[0]
  counter = 1
  while counter <= results.size
    break if results[counter] < current
    if results[counter] >= current
      current = results[counter]
    end
    counter += 1
  end
  array[counter - 1]
end


p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } #== 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } #== [3, 4, 5]
p max_by([-7]) { |value| value * 3 } #== -7
p max_by([]) { |value| value + 5 } #== nil
