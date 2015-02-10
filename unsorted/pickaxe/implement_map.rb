# from page 56 of pickaxe
class Array
  def newMap
    result = []
    each do |value|
      result.push yield(value)
    end
    result
  end
end

test = []
1..30.times do |x|
  test.push x
end
puts test.inspect

puts test.newMap {|x| x * x}.inspect
