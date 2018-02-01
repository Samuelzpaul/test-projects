require 'rspec'

my_array = []
i = 0
g = rand(20)
while i <= g
    my_array << i 
    i += 1  
end
puts my_array.count
puts my_array