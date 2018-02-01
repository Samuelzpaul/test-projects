# CPU VS CPU #
##############
# def play(low, high, turns=1)
#   num = rand(1..10000)
#   print "guessing #{num}\t"
#   case is_it?(num)
#   when 1
#     puts "too high"
#     play(low, num - 1, turns + 1)
#   when -1
#     puts "too low"
#     play(num + 1, high, turns + 1)
#   else
#     puts "found the number in #{turns} turns."
#   end
# end
 
# def is_it?(num)
#   num <=> $number
# end
 
# low, high = 1, 100
# $number = rand(low .. high)
 
# puts "guess a number between #{low} and #{high}"
# play(low, high)


# CPU VS Player #
##################
# number = rand(1..10)

# puts "Guess the number between 1 and 10"
 
# loop do
#   begin
#     user_number = Integer(gets)
#     if user_number == number
#       puts "You guessed it."
#       break
#     elsif user_number > number  
#       puts "Too high."
#     else
#       puts "Too low."
#     end
#   rescue ArgumentError
#     puts "Please enter an integer."
#   end
# end

# Computer Guess Number #
##############################
# def guess beginning, ending
#     rand(beginning..ending)
# end
# def post
#     puts "Thanks for playing! It took #{@guess_count} times to guess your number."
#     puts "Would you like to play again? (y/n)"
#     answer = gets.chomp!
#     play if answer == "y"
# end
# def play
#     puts'
#       |----------------------------------------------|
#       |             Binary Guessing Game             |
#       |----------------------------------------------|
#       '
#     puts 'Please think of a number between 1 to 25'
#     sleep(2)
#     is_correct = false
#     comp_guess = 0
#     @guess_count = 0
#     beginning = 1
#     ending = 25
#     answer = ""
#     loop do
#         puts "Have you thought of your number? (y/n)"
#         answer = gets.chomp!
#         break if answer == "y"
#     end
#     loop do
#         @guess_count += 1
#         comp_guess = guess(beginning, ending)
#         puts comp_guess
#         puts "Higher, lower, or correct?"
#         loop do
#             answer = gets.downcase.chomp!
#             break if answer == "higher" || answer == "lower" || answer == "correct"
#             puts "Please enter only higher, lower, or correct."
#         end
#         if answer == "correct"
#             break
#         elsif answer == "lower"
#             ending = comp_guess - 1
#         else answer == "higher"
#             beginning = comp_guess + 1
#         end
#     end
#     post
# end
# play