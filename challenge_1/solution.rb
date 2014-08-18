require 'test/unit'
extend Test::Unit::Assertions

def getInfo(test=false)
	puts "What's your name?"
	name = test ? "max" : gets.chomp()

	puts "What's your age?"
	age = test ? 26 : gets.chomp()

	puts "What's your reddit username?"
	redditUsername = test ? "iammax" : gets.chomp()

	result = "Your name is #{name}, your age is #{age}, and your reddit username is #{redditUsername}."
	puts result if !test
	return result
end

def testGetInfo
	shouldBeOutput = "Your name is max, your age is 26, and your reddit username is iammax."
	assert_equal shouldBeOutput, getInfo(true)
end

testGetInfo()
getInfo()