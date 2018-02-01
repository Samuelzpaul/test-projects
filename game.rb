WINS = { :computer => 0, :user => 0, :draws => 0 }
HANDLER = {
  :rock     => { :rock => :tie,   :paper => :lose,  :scissors => :win,  :spock => :lose, :lizard => :win  },
  :paper    => { :rock => :win,   :paper => :tie,   :scissors => :lose, :spock => :win,  :lizard => :lose },
  :scissors => { :rock => :lose,  :paper => :win,   :scissors => :tie,  :spock => :lose, :lizard => :win  },
  :spock    => { :rock => :win,   :paper => :lose,  :scissors => :win,  :spock => :tie,  :lizard => :lose },
  :lizard   => { :rock => :lose,  :paper => :win,   :scissors => :lose, :spock => :win,  :lizard => :tie  },
}
def computer
  choice = rand(1..5)
  case choice
  when 1
      return :rock
  when 2
      return :paper
  when 3
      return :scissors
  when 4
      return :spock
  when 5
      return :lizard
  end
end
def compare(outcome)
  if outcome == :win
    puts "You win!"
    WINS[:user] += 1
  elsif outcome == :lose
    puts "You lost!"
    WINS[:computer] += 1
  else
    WINS[:draws] += 1
    puts "Tie game!"
  end
end
def play
  puts '
  |----------------------------------------------|
  |       ROCK PAPER SCISSORS SPOCK LIZARD!      |
  |----------------------------------------------|
  '
  puts "Enter choice: Rock (1), Paper (2), Scissors (3), Spock (4), or Lizard (5)"
  comp_choice = computer
  
  case gets.chomp.to_s.downcase
    when 'rock', '1'
      puts "You chose     : Rock"
      puts "Computer chose: #{comp_choice.capitalize}"
      compare(HANDLER[:rock][comp_choice])
    when 'paper', '2'
      puts "You chose     : Paper"
      puts "Computer chose: #{comp_choice.capitalize}"
      compare(HANDLER[:paper][comp_choice])
    when 'scissors', '3'
      puts "You chose     : Scissors"
      puts "Computer chose: #{comp_choice.capitalize}"
      compare(HANDLER[:scissors][comp_choice])
    when 'spock', '4'
      puts "You chose     : Spock"
      puts "Computer chose: #{comp_choice.capitalize}"
      compare(HANDLER[:spock][comp_choice])   
    when 'lizard', '5'
      puts "You chose     : Lizard"
      puts "Computer chose: #{comp_choice.capitalize}"
      compare(HANDLER[:lizard][comp_choice])
    else
      puts "Invalid choice!"
  end
  puts "Would you like to play again? [Y/N]"
  cont = gets.chomp.downcase
  system "clear" or system "cls" # Clear the screen regardless of os
  if cont == "y"
    play
  else
    puts "Your total score: #{WINS[:user]}  |  Computer total score: #{WINS[:computer]}  |  Total draws: #{WINS[:draws]}"
    puts "Thank you for playing!"
  end
end
play