def select(array)
  counter = 0
  results = []

  while counter < array.size
    result = yield(array[counter])
    results << array[counter] if result
    counter += 1
  end

  results
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
