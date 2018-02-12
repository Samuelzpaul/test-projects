def welcome
    p "battleship"
    p "what's your name?"
    shipsetup(gets.chomp!)
end
def shipsetup(player)
  loop do
    p "Welcome Admiral #{player}!"
    p "Let's place your ships."
    game_board = []
    10.times do |i|
      arr = []
    10.times do |b|
      arr.push(" ")
    end
      game_board.push(arr)
      p arr
    end
  break unless game_over?
  end
end
def game_over?
  p "Good game! Do you want to play again? (press 'y' for yes or 'n' for no)"
  answer = gets.chomp.downcase
    if answer == 'y'
      welcome
    elsif answer != 'y'
      puts "Thanks for playing"
    end
end
  
welcome
