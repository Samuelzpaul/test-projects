puts "Enter a story, terminated by an empty line:"
story = ""
myfile = File.new('word.rb')
until (line = gets).chomp.empty?
  story << line
  story << myfile.to_s
end
 


puts
puts story