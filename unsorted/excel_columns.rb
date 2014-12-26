# encoding: UTF-8
require 'minitest/autorun'

# Given a positive integer, return its corresponding column title as appear in an Excel sheet.

# For example:

#     1 -> A
#     2 -> B
#     3 -> C
#     ...
#     26 -> Z
#     27 -> AA
#     28 -> AB 

ASCII_OFFSET_CONST = 64
ALPHABET_BASE = 26

def excel_column(col_number)
  return -1 unless 
    col_number && col_number.respond_to?(:to_int) && col_number > 1
    
  output_col = []

  while col_number > 0 do 
    output_col.unshift(((col_number % ALPHABET_BASE) + ASCII_OFFSET_CONST).chr)
    col_number = (col_number / ALPHABET_BASE).floor
  end

  output_col.join
end

describe "answer validation" do 
  it "returns correct column encodings" do 
    invalid_input = "I'm Invalid"
    assert_equal -1, 
      excel_column(invalid_input), "should handle invalid input"  

    invalid_input = -42
    assert_equal -1, 
      excel_column(invalid_input), "should handle invalid input" 

    expected_answer = "BB"
    assert_equal expected_answer, 
      excel_column(54), "Should give correct answer for BB"
  end
end