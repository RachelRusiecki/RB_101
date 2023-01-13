# Build a command line calculator program that does the following:
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  case op
  when "1"
    MESSAGES["en"]["adding"]
  when "2"
    MESSAGES["en"]["subtracting"]
  when "3"
    MESSAGES["en"]["multiplying"]
  when "4"
    MESSAGES["en"]["dividing"]
  end
end

prompt(MESSAGES["es"]["welcome"])

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES["es"]["valid_name"])
  else
    break
  end
end

prompt(MESSAGES["en"]["greeting1"] + "#{name}" + MESSAGES["en"]["greeting2"])

loop do # main loop
  number1 = ""
  loop do
    prompt(MESSAGES["en"]["first_number"])
    number1 = gets.chomp
    
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["en"]["valid_number"])
    end
  end

  number2 = ""
  loop do
    prompt(MESSAGES["en"]["second_number"])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["en"]["valid_number"])
    end
  end

  prompt(MESSAGES["en"]["what_operation"])

  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["en"]["valid_operator"])
    end
  end

  prompt("#{operation_to_message(operator)}" + MESSAGES["en"]["operator"])

  result = case operator
           when "1"
             number1.to_i + number2.to_i
           when "2"
             number1.to_i - number2.to_i
           when "3"
             number1.to_i * number2.to_i
           when "4"
             number1.to_f / number2.to_f
           end

  prompt(MESSAGES["en"]["result"] + "#{result}")

  prompt(MESSAGES["en"]["continue"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["en"]["closing"])
