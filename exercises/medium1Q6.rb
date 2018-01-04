# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
Observations:
-The proc method has a block of code that is passed in as an argument and is set to the local variable my_proc
-The my_proc variable is passed in as an argument to the puts method invocation and the class and an encoding of the object id is output
which indicates that we have an object
-The class method is called on the my_proc variable and is passed in to the puts method invocation and Proc is output
-The call method is called on the my_proc variable and invokes the block which outputs "This is a ."
-The call method is called on the my_proc variable and invokes the block which outputs "This is a cat."

One thing I noticed is when my_proc.call was invoked we did not get an error because the local variable thing was not assigned it just returned nil.
ALso to invoke a proc we have to call the call emthod on it
procs are created by the proc keyword
=end


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

=begin
-The lambda method was called and a block is passed in as an argument which is stored in local variable my_lambda.
-There is a -> which seems like a method call and thing is passed in as anargument as well as a block
-The puts method invocation takes in my_lambda in as an argument which outputs the class name and an encoding of an object id.
-The puts method invocation takes in my_second_lambda in as an argument which outputs the class name and an encoiding of an object id.
-my_lambda.class was passed into the puts method invocation which outputs the class of the lambda which is a Proc
-call was called on the my_lambda variable and 'dog' was passed in as an argument and the block was invoked and outputted This a dog
-call was called on my_lambda and an ArgumentError was returned saying that it expected 1.
-The new method is called on Lambda and a block is passed in as an argument and the value is stored in the my_third_lambda variable. This
returned an NameError probably because this is an incorrect way to create a lambda.

Looks like there are two ways to create a lambda
Also it seems like a lambda is a type of Proc since it is of the Proc class
Also looks like lambdas will return an ArgumentError if you dont pass the corrent amount of arguments to the lambda
=end


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
-The block_method_1 method was called and 'seal' was passed in as an argument and a block was passed in as an argument as well so when yield
was called in the method This is a . was output.
Inside the implicit block that we passed in we try to use the blocks argument local variable seal however we did not pass in an argument
to the yield call so nil is returned when we reference seal. If we wanted to have our block argument be assigned to 'seal' we could call it like This
yield(animal) which would pass 'seal' (becasue animal points to seal) to the seal local variable of block and that would have worked

-'seal' is passed to the block_method_1 however a block is not passed this time. Since we called yield from inside the method and there was
no block that was passed in to the method we get a LocalJumpError if we pass in a block or delete the yield keyword the error would go away

If you want use an argument in a block you have to pass an argument to yield in order to use it or else nil will be returned
If we have a yield inside our block we need to make sure we pass in a block as an argument or utilize the block_given? method in a conditionsal
or else LocalJumpError will be returned
=end



# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
-The string 'turtle' is passed into the block_method_2 as an argument and the block is
passed into the method as an implicit argument and inside the method there is a yield
with the local variable animal that is passed to the block as an argumetn and THis is a turtle is output
-THe string 'turtle' is passed in as an argument as well as a block which is an implicit argument to the method
Inside the method yield was called with animal passed in as an argument wihch gets passed to the blocks argument
turtle and the block outputs This is a turtle and a . There was a second argument to the block but we only
passed in one argument to the yield method which caused the second argument of the block to return nil.
-The 'turtle' is passed into the block_method_2 as an argument as well as the block is being passed in as an implicit argument
Yield is called and animal is passed into the block as an argument however the block does not take any arguments and
we are trying to reference the local variable animal however we get a NameError message because Ruby says the local
variable or method animal is undefined. So in order for the block to work we need to give the block an argument called animal.

We can pass an argument to the block from the method by passsing in an argument to yield. If we have one too many
arguments in the block and we try to reference the extra block argument nil will be returned.
If we try to reference a variable in the block we need to make sure we create an argument with the same name or else an error
will be returned saying that there is a NameError
=end

=begin
Creating a block:
-blocks are created by do..end or {..}

How to use a block:
-Blocks can be used by passing them into a method implicitly and then calling yield which will cause the block to
be executed.

Arity:
-If you want use an argument in a block you have to pass an argument to yield in order to use it or
else nil will be returned

Creating a proc:
-procs are created by calling proc and passing a block in as an argument

How to use a proc:
-Have to store the proc object in a variable and use the call method on the variable

Arity:
-If the block takes an argument and we dont use that argument nil will be returned

Creating a lambda:
-lambdas are created by lambda and passing a block in as an argument or by
-> and passing in a block in as an argument

How to use a lambda:
-Have to store the lambda (proc object) into a variable and use the call method on the variable

Arity:
-lambdas will return an ArgumentError if you dont pass the corrent amount of arguments to the lambda
=end
