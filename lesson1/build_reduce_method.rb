def reduce(array, acc = 0)
  counter = 0
  total = acc

  while counter < array.size
    result = yield(0, array[counter])
    total += result
    counter += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
