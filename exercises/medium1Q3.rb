items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  list = ["Let's start gathering food.", "#{items.join(', ')}", "Let's start gathering food."]
  list.each do |item|
    yield(item)
  end
end

gather(items) { |item| puts item }
