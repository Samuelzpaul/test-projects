story.scan(/(?<=[<]).+?(?=[>])/).uniq.each do |var|
  print "Enter a value for '#{var}': "
  story.gsub!(/<#{var}>/, gets.chomp)
end