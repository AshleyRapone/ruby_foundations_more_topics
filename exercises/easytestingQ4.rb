# Write a minitest assertion that will fail if the Array list is not empty.
assert_equal(0, list.size)
assert_equal([], list)

assert_empty(list)
# tests whether the argument responds to the method #empty? with a true value

assert_equal(true, list.empty?)
# passes if the list is empty
