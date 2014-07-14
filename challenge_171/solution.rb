#solution to challenge #171 here:
#http://www.reddit.com/r/dailyprogrammer/comments/2ao99p/7142014_challenge_171_easy_hex_to_8x8_bitmap/
#

loop do
	puts "Enter your hex, or type 'q' to quit:"
	input = gets.chomp()

	break if input == 'q'

	input = input.split(" ").map{|i| i.to_i(16)} #get integers for our hex
	input = input.map{|i| i.to_s(2).rjust(8, '0')} #convert to binary and pad
	input = input.map{|i| i.gsub('1', '#').gsub('0', ' ')}#substitute occurences
	puts input
end
