# page 53 of pickaxe
# implement fibonnacci

def fibonacci_up_to(max)
  x, y = 1, 1
  while x < max
    test = yield x
    puts test
    x, y = y, x + y
  end
end

fibonacci_up_to(1000) do
  |x| print x, " "
  "thirty"
end
