# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1, 2, 2, 3 (on separate lines) because the .uniq method does not mutate the caller.
