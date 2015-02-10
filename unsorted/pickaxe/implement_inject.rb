# from page 57 of the pickaxe book

class Array
  def newInject(cumulative_value = 0)
    each do |value|
      cumulative_value = yield(cumulative_value, value)
    end
    cumulative_value
  end
end

puts [1,3,5,7].newInject {|sum, element| sum + element}
puts [1,3,5,7].inject {|product, element| product*element}
