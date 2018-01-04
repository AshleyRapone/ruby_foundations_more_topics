def each_cons(array)
  hash = {}
  counter1 = 0
  counter2 = 1
  while counter1 <= array.size - 2
    value1 = array[counter1]
    value2 = array[counter2]
    yield(value1, value2)
    counter1 += 1
    counter2 += 1
  end
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
