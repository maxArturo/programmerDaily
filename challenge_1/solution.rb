# encoding: UTF-8

require 'test/unit'
extend Test::Unit::Assertions

def get_info(test = false)
  puts "What's your name?"
  name = test ? 'max' : gets.chomp

  puts "What's your age?"
  age = test ? 26 : gets.chomp

  puts "What's your reddit username?"
  reddit_username = test ? 'iammax' : gets.chomp

  result = 'Your name is #{name}, your age is #{age}, '\
    'and your reddit username is #{reddit_username}.'
  puts result unless test
end

def test_get_info
  should_be_output = 'Your name is max, your age is 26, '\
    'and your reddit username is iammax.'
  assert_equal should_be_output, get_info(true)
end

test_get_info
get_info