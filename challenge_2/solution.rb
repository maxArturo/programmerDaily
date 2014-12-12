# encoding: UTF-8

#this is a calculator that returns a date-key, as defined by the number of days between an input date and 
#1999-12-26 00:00:00.0. It works both ways.
#because of silly requirements one really shouldn't use a date before then, so any date before then will just return a notice.

require 'test/unit'
require 'date'
extend Test::Unit::Assertions

masterDate = Date.new(1999, 12, 26)

def convert_date_key(inputDate)
  puts "Please enter either a SCW date key to convert, or a date to convert to SCW date key (in format of '07/04/2010')"
  inputDate = Integer(gets) unless inputDate.nil? rescue nil

  

  puts "What's your age?"
  age = test ? 26 : gets.chomp

  puts "What's your reddit username?"
  reddit_username = test ? 'iammax' : gets.chomp

  result = 'Your name is #{name}, your age is #{age}, '\
    'and your reddit username is #{reddit_username}.'
  puts result unless test
end

def test_bad_date
  should_be_output = 
  assert_equal should_be_output, convert_date_key(true)
end

def test_convert_date_key
  #date = Date.new(2008, 12, 22)

  should_be_output = 
  assert_equal should_be_output, convert_date_key(true)
end

test_convert_date_key
convert_date_key
