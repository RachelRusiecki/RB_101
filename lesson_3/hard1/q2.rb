# What is the result of the last line in the code below?

greetings = { a: "hi" }
informal_greeting = greetings[:a]
informal_greeting << " there"

puts informal_greeting
puts greetings

# This will display the hash { a => "hi there" } because we mutated that specific index.
