# encoding: UTF-8

#Sieve of erathostenes
require 'minitest/autorun'
require 'prime'

def erathostenes_sieve(n)
  primes = []

  if n && n.respond_to?(:to_int) && n > 1
    if n == 2
      return [2]
    end
    primes[2] = 2
    3.step(n, 2) {|i| primes[i] = i }

    3.step((Math.sqrt(n).floor), 2){|i|
      if primes[i]
        (i**2).step(n, i) {|j| 
          primes[j] = nil
        }
      end
    }  
    primes.compact!
  else
    -1
  end
end

describe "answer validation" do 
  it "returns valid primes" do 
    invalid_input = "I'm Invalid"
    assert_equal -1, 
      erathostenes_sieve(invalid_input), "should handle invalid input"  

    invalid_input = 0
    assert_equal -1, 
      erathostenes_sieve(invalid_input), "should handle 0"

    invalid_input = 1
    assert_equal -1, 
      erathostenes_sieve(invalid_input), "should handle edge cases"

    primes_up_to = 10
    assert_equal Prime.take_while {|p| p < primes_up_to }, 
      erathostenes_sieve(primes_up_to), "should have same primes"  

    primes_up_to = 15**5
    assert_equal Prime.take_while {|p| p < primes_up_to }, 
      erathostenes_sieve(primes_up_to), "should have same primes"  
  end
end