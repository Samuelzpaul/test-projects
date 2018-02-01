# def recursive_countdown(attempt)
#   return if attempt.zero?
#   puts attempt
#   recursive_countdown(attempt-1)
# end

# recursive_countdown(11910)

####################
# def sum_array(arr)
#   total_sum = 0

#   arr.each do |element|
#     total_sum += element
#   end
#   return
# end
# my_array = [1, 2, 3]
# p sum_array(my_array)

######################
# require 'pry'

# my_array = (1..10).to_a

# def recursive_sum_array(arr)

#   if arr.empty?
#     0
#   else
#     head, *tail = arr
#     binding.pry
#     head + recursive_sum_array(tail)
#   end

# end

# p recursive_sum_array(my_array)

#################################


def factorial_iterative number
  if number == 0 || number == 1
    1
  else
    sum = 1
    number.times do |n|
      sum *= (n + 1)
    end
    puts sum
  end
end

factorial_iterative(100)