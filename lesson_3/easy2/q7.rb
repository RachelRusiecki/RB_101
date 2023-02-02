# In the previous practice problem we added Dino to our array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# We could have used either Array#concat or Array#push to add Dino to the family. How can we add multiple items to our array? (Dino and Hoppy)

p flintstones.insert(-1, "Dino", "Hoppy")
