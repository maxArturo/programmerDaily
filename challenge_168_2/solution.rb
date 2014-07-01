#solution for problem 168_2
emptyWord = ""
firstWord =  "The lazy cat slept in the sunlight."
sampleWord = "...You...!!!@!3124131212 Hello have this is a --- string Solved !!...? to test @\n\n\n#!#@#@%$**#$@ Congratz this!!!!!!!!!!!!!!!!one ---Problem\n\n"

def indexWord(wordToIndex, index)
	result = wordToIndex.split(%r{[^a-zA-Z0-9]+}).delete_if{|i| i == ""}
	return (index - 1) <= result.length && (index - 1) >= 0 ? result[index - 1] : ""
end

puts indexWord(emptyWord, 3)
puts indexWord(firstWord, 8)
puts indexWord(sampleWord, 2)