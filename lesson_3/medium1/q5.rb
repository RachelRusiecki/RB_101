# What's wrong with the code? How would you fix this so that it works?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

def fib_revised(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib_revised(0, 1, limit)
puts "result is #{result}"

# The limit variable is defined outside the method and therefore cannot be referenced inside the method. To fix, you can set the limit variable inside the method or add a third argument.

