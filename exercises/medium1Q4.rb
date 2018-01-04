birds = ['crow', 'finch', 'hawk', 'eagle', 'osprey']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
