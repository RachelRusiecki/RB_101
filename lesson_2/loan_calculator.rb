puts "Welcome to Mortgage Calculator!"
puts "-------------------------------"

loop do
  puts "What is the loan amount?"
  loan_amount = ""
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f < 0
      puts "Must enter positive number."
    else
      break
    end
  end

  puts "What is the Annual Percentage Rate (APR)?"
  puts "(Example: 5 for 5% or 2.5 for 2.5%)"
  interest_rate = ""
  loop do
    interest_rate = gets.chomp
    if interest_rate.empty? || interest_rate.to_f < 0
      puts "Must enter a positive rate."
    else
      break
    end
  end

  monthly_interest_rate = interest_rate.to_f / 1200

  puts "What is the loan duration? Please enter years."
  loan_duration_years = ""
  loop do
    loan_duration_years = gets.chomp
    if loan_duration_years.empty? || loan_duration_years.to_i < 0
      puts "Enter a valid number."
    else
      break
    end
  end

  puts "And months?"
  loan_duration_months = ""
  loop do
    loan_duration_months = gets.chomp
    if loan_duration_months.empty? || loan_duration_months.to_i < 0
      puts "Enter a valid number."
    else
      break
    end
  end

  total_duration = loan_duration_months.to_i + (loan_duration_years.to_i * 12)

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-(total_duration))))

  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}."
  puts "Another calculation?"
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

puts "Thank you for using the Mortgage Calculator!"
puts "Goodbye!"
