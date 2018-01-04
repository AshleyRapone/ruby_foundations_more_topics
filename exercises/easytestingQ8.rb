# Write a minitest assertion that will fail if the class of value is not Numeric or
# one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

assert_kind_of(Numeric, value)
# checks to see if the class of the second argument is an instance of the Numeric class
# or one of the named class's subclasses 
