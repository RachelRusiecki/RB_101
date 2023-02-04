# # Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# my_string will still be just "pumpkins" because the return value of the method is ONLY the last line of code. In this case, it is the array parameter, which will now be ["pumpkins", "rutbaga"]
# Also, a_string_param is now pointing to a differnet object. This is object reassignment.
