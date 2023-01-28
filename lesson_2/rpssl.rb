VALID_CHOICES = { "rock" => "r",
                  "paper" => "p",
                  "scissors" => "sc",
                  "lizard" => "l",
                  "spock" => "sp" }

WINNING_MOVES = { "rock" => ["scissors", "lizard"],
                  "paper" => ["rock", "spock"],
                  "scissors" => ["paper", "lizard"],
                  "lizard" => ["paper", "spock"],
                  "spock" => ["rock", "scissors"] }

def prompt(message)
  puts "=> #{message}"
end

def winning_conditions(first, second)
  WINNING_MOVES[first].include?(second)
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

def full_answer(answer)
  case answer
  when "r" then "rock"
  when "p" then "paper"
  when "sc" then "scissors"
  when "l" then "lizard"
  when "sp" then "spock"
  else answer
  end
end

choose_prompt = <<-MSG
  Choose one: #{VALID_CHOICES.keys.join(', ')}
  r = rock
  p = paper
  sc = scissors
  l = lizard
  sp = spock
MSG

choice = ""
player_score = 0
computer_score = 0

loop do
  loop do
    loop do
      prompt(choose_prompt)
      choice = gets.chomp
      if VALID_CHOICES.flatten.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose: #{full_answer(choice)};" \
      " Computer chose: #{computer_choice}")

    prompt(display_results(full_answer(choice), computer_choice))

    if winning_conditions(full_answer(choice), computer_choice)
      player_score += 1
    elsif winning_conditions(computer_choice, full_answer(choice))
      computer_score += 1
    end

    prompt("Current Score: You - #{player_score}," \
      " Computer - #{computer_score}.")
    break if player_score == 3 || computer_score == 3
  end

  if player_score > computer_score
    prompt("Congrats! You are the grand winner!")
  else
    prompt("Sorry! The computer is the grand winner. Better luck next time.")
  end

  prompt("Do you want to play again? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
  player_score = 0
  computer_score = 0
end

prompt("Thank you for playing. Goodbye!")
