# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# Ruby cannot concatenate different types of objects, in this case strings and integers.

# Fix #1 is to use string interpolation:
puts "the value of 40 + 2 is #{40 + 2}"

# Fix #2 is to convert the integer to a string:
puts "the value of 40 + 2 is " + (40 + 2).to_s
