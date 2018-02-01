class Person
  def breathe
    puts "inhale and exhale"
  end
end



class Baby < Person
  def speak
    puts "Goo Goo Ga Ga"
  end
end

my_baby = Baby.new
puts mymaby.methods.sort