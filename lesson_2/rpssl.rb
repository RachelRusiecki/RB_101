VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def winning_conditions(first, second)
  (first == "rock" && (second == "scissors" || second == "lizard")) ||
    (first == "paper" && (second == "rock" || second == "paper")) ||
    (first == "scissors" && (second == "paper" || second == "lizard")) ||
    (first == "lizard" && (second == "paper" || second == "spock")) ||
    (first == "spock" && (second == "rock" || second == "scissors"))
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

choose_prompt = <<-MSG
  Choose one: #{VALID_CHOICES.join(", ")}
  r = rock
  p = paper
  sc = scissors
  l = lizard
  sp = spock
MSG

loop do
  choice = ""
  loop do
    prompt(choose_prompt)
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
