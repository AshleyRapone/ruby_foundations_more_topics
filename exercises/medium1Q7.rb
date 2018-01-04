# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

puts check_return_with_proc

=begin
When we call the call method on the my_proc the proc object becomes executed and inside the block
there is a return which will end the program and the program returns nil
procs use the return value for the block as the methods return value.
=end


# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

puts check_return_with_proc_2(my_proc)

=begin
the check_return_with_proc_2 method is called and my_proc(proc object) is passed in as an argument
and is passed to the local variable my_proc
my_proc is called and a LocalJumpError is returned becasue the proc is outside the method and cant be
passed into a method
=end


# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

=begin
lambdas return value are not used for the return value of the method so that is why nil is returned
because puts was the last executable line of the method.
=end


# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

=begin
The return value of the method is nil because puts was the last executable line of the method
We can pass in lambdas into a method.
=end


# Group 5
def block_method_3
  yield
end

block_method_3 { return }

=begin
The method uses the blocks return as the return value for the method so when we call yield
and the block executes since the block returns return there becomes a LocalJumpError becasue it
is looking for a block to invoked and the return value causes issues
=end

=begin
Blocks:
-Methods use the return value of the block for the return value of the method
-Thus if there is a return in the block a LocalJumpError occurs because yield is trying to invoke
a block

procs:
-procs cannot be passed into methods
-methods use the return value of the proc

lambdas:
-lambdas can be passed into methods
-methods do not use the reutrn value of the lambdas
=end
