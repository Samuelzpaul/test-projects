require 'rspec'

class Hash
  def param_converter
    elements = []
    keys.size.times do |i|
      elements << "#{keys[i]}=#{values[i]}"
    end
    elements.join('&')
  end
end

describe 'HTML Param Converter' do
  it 'Adds an HTML param converter to the Hash class' do
    hash = { :topic => "baseball", :team => "astros" }
    expect(hash.param_converter).to eq('topic=baseball&team=astros')
  end
end

hash = { :topic => "baseball", :team => "astros" }
hash.param_converter