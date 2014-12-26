# encoding: UTF-8
require 'minitest/autorun'
require 'byebug'

#https://oj.leetcode.com/problems/text-justification/

def text_justify(word_array, justify_length)
  return -1 unless 
    word_array && word_array.count > 0 && 
      justify_length > 0
  
  running_count, result, line_array = 0, [], []
  while word_array.any? do
    #debugger
    if running_count + word_array.first.length + 
      (line_array.any? ? line_array.length : 0) > justify_length
      result.push line_justify(line_array, line_array.count == 1, 
        justify_length)
      running_count = word_array.first.length
      line_array = [word_array.shift]
    else
      running_count += word_array.first.length
      line_array.push word_array.shift
    end
  end

  result.push line_justify(line_array, line_array.count == 1,
   justify_length)
  result
end

def line_justify(line_array, left_justify, total_length)
  word_length = line_array.inject(0){|sum, n| sum += n.length}
  space_length = total_length - word_length
  if left_justify
    line_array.join + (" " * space_length)
  else
    mod_spaces = space_length % (line_array.length - 1)
    even_spaces = space_length / (line_array.length - 1)
    line_array.inject do |memo, n|
      additional_space = mod_spaces > 0 ? 1 : 0
      mod_spaces -= 1
      memo + (" ") * even_spaces + (" " * additional_space) + n
    end
  end
end

describe "answer validation" do 
  it "returns correct answers" do 
    input = ["This", "is", "an", "example", "of",
     "text", "justification."]
    answer = [
     "This    is    an", "example  of text", "justification.  "]
    assert_equal answer, text_justify(input, 16)
  end
end