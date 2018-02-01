require 'pry'

# def greeting
#   hi = "hello world!"
# end

# puts greeting
##############################
# def askname
#   p "May I have your name?"
#   name = gets.chomp!
#   p "Hello #{name}"
# end

# askname

##############################
# def askname
#   p "Who's there?"
#   name = gets.chomp!
#   if name == "rick" || name == "daryl" || name == "michone"
#   p "Hello #{name}"
#   else
#     p "Please grab some party snacks!"
#   end
# end

# askname

##############################

# def numdetect 
#   p "odd or even detector, choose a number!"
#   num = gets.chomp!.to_i
#   if num % 2 == 0
#     p "number is even"
#   else
#     p "number is odd"
#   end
# end

# numdetect

##############################

# def fzbz
#  p "fizzbuzz game time!"
#   num = gets.chomp!.to_i
#   if num % 3 == 0 && num % 5 == 0
#     p "fizzbuzz"
#   elsif num % 3 == 0
#     p "fizz"
#   elsif num % 5 == 0
#     p "buzz"
#   end
# end

# fzbz

##############################
# Write a program that asks for two numbers and does all the math things to those two numbers #

# def mathing
#  p "Lets do some mathing, please pick your first number.."
#  num1 = gets.chomp!.to_i
#  p "Please choose a second number.."
#  num2 = gets.chomp!.to_i
#  puts num1 + num2
#  puts num1 - num2
#  puts num1 % num2
#  puts num1 * num2
# end

# mathing

##############################

# def addrnge
#  p "pick a number"
#  num = gets.chomp!.to_i
# num + (1..num).inject(:+)
# end

# puts addrnge

##############################

# def retelem
#   arr = [67, 8, 25, 13, 2, 65, 6, 10, 11].sort!.max
# end

# puts retelem

##############################
# Reverse a string without using .reverse

# def reverse_string(string)
#   p "Hello my name is Sam"
#   split_string = string.split("")
#   reversed = []
#   string.size.times { reversed << split_string.pop }
#   reversed.join
# end
# puts reverse_string("Hello my name is Sam")

##############################
# Sort through an array of numbers and give the highest number without using .max 

# def arrmaxval
#   arr = [67, 23, 34, 56, 5, 10, 21, 1, 22, 33]
#   puts arr.sort.last
# end

# arrmaxval

##############################
# Write a method that checks whether an element occurs in an array.     if it does, notify the user it exists.  If it does not, ask them for another suggestion or allow them to quit.

# def checkarr
#   arr = [16, 35, "fish", 34, 67, "table"]
#   arr.include?("cat")
# end

# puts checkarr

##############################
# Write a method that combines two arrays by alternatingly grabbing elements, e.g. [a,b,c], [1,2,3] → [a,1,b,2,c,3].

# def combarr
#   arr1 = [1,2,3]
#   arr2 = ["a","b","c"]
#   arr1.zip(arr2).flatten.compact.to_s
# end

# puts combarr

##############################

