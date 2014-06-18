print "Enter your paragraph: "
paragraphInput = gets.chomp()

puts "Here's your HTML:"

docTypeTag = "<!DOCTYPE html>\n"
htmlTags = ['html', ['head', 'title'] , ['body', 'p']]

=begin
	Instead of using a traditional tree, I opted for nested arrays. The reason is that if
	I went with a tree, I'd have to specify ordinality to make everything show correctly, or feed
	the nodes in order. I could have done that but that would involve objects and I really just wanted
	to force this to be a simple function with arrays...

	Each array level defines the level of tags. Ex:
		no array (a simple string)	=> 'html', leftmost tags
		an array with one element   => ['h1'], starts at previous array's indentation
		an array with two elements  => ['body', 'p'] starts with previous array's indentation and indents subsequent elements

	This means that in order to put tags at the same level of indentation you'd have to ensure they are contained within the same array.
=end

def generateHtml(tagArray, tabCounter = 0, inputHTML = "", pTagText = "")
	if tagArray.kind_of?(Array)
		reverseTagArray = []
		tagArray.each do |tag|
			#call recursively on other arrays
			if tag.kind_of?(Array)
				inputHTML = generateHtml(tag, tabCounter, inputHTML, pTagText)
			else
				reverseTagArray.unshift(tag)
				inputHTML += ("\t" * tabCounter) + "<" + tag + ">\n"
				tabCounter += 1
				
				if tag == "p"
					inputHTML += ("\t" * tabCounter) + pTagText + "\n"
				end
			end
		end

		#put the tags back
		reverseTagArray.each do |reverseTag|
			tabCounter -= 1
			inputHTML += ("\t" * tabCounter) + "</" + reverseTag + ">\n"
		end
	end
	return inputHTML
end

outputHtml = generateHtml(htmlTags, 0, docTypeTag, paragraphInput)
puts outputHtml	