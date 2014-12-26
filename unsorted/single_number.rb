# https://oj.leetcode.com/problems/single-number/
# Given an array of integers, every element appears twice except for one. 
#Find that single one.
# 
# Note:
# Your algorithm should have a linear runtime complexity. 
# Could you implement it without using extra memory?

def findSingleton(number_array)
  solution_hash = {}
  number_array.each do |n|
    if solution_hash.has_key? n
      solution_hash[n] = 1
    else
      solution_hash[n] = 0
    end
  end
  
  solution_hash.select!{|k,v| v == 0}
end

puts findSingleton([1,1,2,2,3,3,66,66,128,15,15])