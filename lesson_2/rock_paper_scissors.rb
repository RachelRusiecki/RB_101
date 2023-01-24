VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt("test message")
end

def prompt(message)
  puts "=> #{message}"
end

def winning_conditions(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  if winning_conditions(player, computer)
    "You won!"
  elsif winning_conditions(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  prompt(display_results(choice, computer_choice))

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing. Goodbye!")
