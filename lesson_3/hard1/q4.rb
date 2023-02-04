def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

def is_an_ip_number?(num)
  (0..255).include?(num.to_i)
end

# You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address. Fix it.

def revised_dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

p revised_dot_separated_ip_address?("18.1.3.8")
p revised_dot_separated_ip_address?("4.5.5")
p revised_dot_separated_ip_address?("1.2.3.4.5")
p revised_dot_separated_ip_address?("300.400.500.600")
