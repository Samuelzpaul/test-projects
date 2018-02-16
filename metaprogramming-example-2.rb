class String
  def censor (bad_word)
      self.gsub! "#{bad_word}", "CENSORED"
  end
end

p "Justin smells like a bunny jelly bean.".censor("bunny")