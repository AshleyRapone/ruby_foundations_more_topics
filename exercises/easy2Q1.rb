def step(start, last, step)
  number = start
  while number <= last
    yield(number)
    number += step
  end
  (start..last)
end

puts step(1, 10, 3) { |value| puts "value = #{value}" }
