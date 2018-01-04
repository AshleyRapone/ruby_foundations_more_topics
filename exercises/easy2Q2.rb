def zip(array1, array2)
  results = []
  counter = 0
  while counter < array1.size
    results << [array1[counter], array2[counter]]
    counter += 1
  end
  results
end


p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
