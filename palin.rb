require 'rspec'

def palindrome? (string)
  if string.lowercase! = string.reverse.lowercase!
    return true
  else 
    puts "false"
  end
end

describe 'Check if a word is a palindrome' do
  it 'returns true if the word is a palindrome, false if not' do
    expect(palindrome?('tacocat')).to be(true)
    expect(palindrome?('Tacocat')).to be(true)
    expect(palindrome?('baseball')).to be(false)
  end
end