# Write a minitest assertion that will fail if the value.odd? is not true.

assert value.odd?, 'value is not odd'
# assert tests whether its first argument is truthy and if the first argument is not truthy and the
# fails the second argument is displayed as the failure message

assert_equal(true, value.odd?)
