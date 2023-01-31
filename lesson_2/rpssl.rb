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

def wins_against?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_results(player, computer)
  if wins_against?(player, computer)
    "You won!"
  elsif wins_against?(computer, player)
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

def prompt_user_choice
  choice = ""
  loop do
    prompt(CHOOSE_PROMPT)
    choice = gets.chomp.downcase
    if VALID_CHOICES.flatten.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  choice
end

def play_again?
  prompt("Do you want to play again? (Y/N)")
  answer = gets.chomp
  answer.downcase.start_with?("y")
end

CHOOSE_PROMPT = <<-MSG
  Choose one: #{VALID_CHOICES.keys.join(', ')}
  r = rock
  p = paper
  sc = scissors
  l = lizard
  sp = spock
MSG

intro = <<-MSG
  Welcome to Rock, Paper, Scissors, Lizard, Spock!
  First to win 3 games wins the match.
  How to Play:
  Rock smashes Scissors and crushes Lizard.
  Paper covers Rock and disproves Spock.
  Scissors cuts Paper and decapitates Lizard.
  Lizard eats Paper and poisons Spock.
  Spock smashes Scissors and vaporizes Rock.
MSG

player_score = 0
computer_score = 0

prompt(intro)

loop do
  loop do
    choice = prompt_user_choice

    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose: #{full_answer(choice)};" \
      " Computer chose: #{computer_choice}")

    prompt(display_results(full_answer(choice), computer_choice))

    if wins_against?(full_answer(choice), computer_choice)
      player_score += 1
    elsif wins_against?(computer_choice, full_answer(choice))
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

  break unless play_again?
  player_score = 0
  computer_score = 0
end

prompt("Thank you for playing. Goodbye!")
