# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# Nothing because in Ruby, everything is considered true, so greeting is not assigned to "hello world". Instead it is assigned to nil.
