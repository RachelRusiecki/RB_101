# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# How can you make this work without using the begin/end until construct?
# Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors_revised(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if (number % divisor == 0)
    divisor -= 1
  end
  factors
end

p factors_revised(18)
p factors_revised(0)
p factors_revised(-1)

# What is the purpose of the number % divisor == 0 ?
# This tells us that a number goes into another number evenly with no remainders.

# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# The method returns the last line of code. We want to return the factors array, so we must call it as our last line of code.
