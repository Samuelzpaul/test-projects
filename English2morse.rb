# chars = ",.0123456789?abcdefghijklmnopqrstuvwxyz"  
# codes = %w(--..-- .-.-.- ----- .---- ..--- ...-- ....- ..... -.... --... ---..  
#            ----. ..--.. .- -... -.-. -... . ..-. --. .... .. .--- -.- .-.. --  
#            -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..)  
  
# MORSE = Hash[chars.split("").zip(codes)]  
# MORSE.default=" "  
  
# def char2morse(chars)  
#   chars.downcase.split("").map{|c|MORSE[c]}.join(" ")  
# end  
  
# p char2morse("Pizza Day today") 

ARGF.each_line { |line| puts line.chomp.upcase.gsub(//, " ").gsub(/[^A-Z0-9:;=+_"$@ -]/, "-").gsub(/[A-Z0-9:;=+_"$@-]/, Hash[*%w(A .- B -... C -.-. D -.. E . F ..-. G --. H .... I .. J .--- K -.- L .-.. M -- N -. O --- P .--. Q --.- R .-. S ... T - U ..- V ...- W .-- X -..- Y -.-- Z --.. . .-.-.- , --..-- ? ..--.. / -..-. @ .--.-. 1 .---- 2 ..--- 3 ...-- 4 ....- 5 ..... 6 -.... 7 --... 8 ---.. 9 ----. 0 ----- : ---... ; -.-.-. = -...- + .-.-. - -....- _ ..--.- " .-..-. $ ...-..- @ .--.-.)]).strip }
