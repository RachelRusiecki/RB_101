# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# 1. What is != and where should you use it?
# Does Not Equal, use it in conditionals.

# 2. Put ! before something, like !user_name
# Will return the object's opposite boolean value
user_name = "username"
p !user_name

# # 3. Put ! after something, like words.uniq!
# # No Method Error
words = %w(cat cat dog)
p words.uniq!!

# 4. Put ? before something
# Used as a ternary operator, true condition : false condition

# 5. Put ? after something
# References a method that returns a boolean.

# 6. Put !! before something, like !!user_name
# Will return the object's boolean value.
p !!user_name
