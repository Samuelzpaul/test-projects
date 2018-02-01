require 'rspec'
require 'benchmark'

arr = Array.new(100_000_000). { rand 1000 }

def new_max array_of_elements
    max_value = 0

    array_of_elements.each do |i|
      if i > max_value
        max_value = 1
      end
    end

    max_value
  end

 benchmark.bm(15) do |x|
   x.report('Each: ') { new_max arr }
   x.report('Sorted: ') { arr.sort.last }
   x.report('Max: ') { arr.max }
end