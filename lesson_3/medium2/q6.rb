# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_simplified(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
p color_valid_simplified("red")
