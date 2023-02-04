# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# a and c have the same object ID because c is equal to a. b is different because even though the string has the same value, it is a separate object from a.
