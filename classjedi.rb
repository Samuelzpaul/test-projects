class Jedi
  
  def lightsaber
    color = 'green'
  end

end

j = Jedi.new
p j.lightsaber


class StarWars

  def lightsaber
    @lightsaber
  end

  def lightsaber=(value)
    @lightsaber = value
  end

end

luke = StarWars.new
p luke.lightsaber

luke.lightsaber = "green"
p luke.lightsaber

vader = StarWars.new
p vader.lightsaber

vader.lightsaber = "red"
p vader.lightsaber

class StarWars
  def lightsaber
    @lightsaber
  end

  def lightsaber=(green)
    @lightsaber = green
  end

end

class StarWars
  attr_reader
  attr_writer
end

class StarWars
  attr_accessor
end