def lobby
  p "range or sum"
  options(gets.chomp!)  
end

def addition
 p "Time to Add" 
  loop do
    p "pick a number between 1 and 100" 
    number = gets.chomp!.to_i
    puts number.sum(+1)
  end
end


def options choice
  case choice.downcase
  when "range add" then range
  when "sum" then addition
  else 
    p "Thats not an option"
  end
end

lobby