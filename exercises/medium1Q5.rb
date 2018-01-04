items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1.
gather(items) do | *food, leftovers|
  puts food.join(', ')
  puts leftovers
end

# 2.

gather(items) do |food, *leftovers, more_food|
  puts food
  puts leftovers.join(', ')
  puts more_food
end

# 3.
gather(items) do | food, *leftovers|
  puts food
  puts leftovers.join(', ')
end

# 4.
gather(items) do | food1, food2, food3, food4|
  puts "#{food1}, #{food2}, #{food3}, and #{food4}"
end
