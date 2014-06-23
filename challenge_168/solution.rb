#solution for problem 168
#source of names come from http://api.randomuser.me/
require "rubygems"
require "json"
require "net/http"
require "uri"

API_URL = "http://api.randomuser.me/?results="
MAX_API_NAMES = 20
puts "Enter number of names and scores:"
nameCount = gets.chomp().to_i

firstNames = []
lastNames = []

def fillNames(firstNameArr, lastNameArr, noOfNames)
	
	while noOfNames > 0
		apiCounter = noOfNames % MAX_API_NAMES == noOfNames ? noOfNames : MAX_API_NAMES
		noOfNames -= apiCounter
		
		uri = URI.parse(API_URL + apiCounter.to_s)
	 
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		 
		response = http.request(request)
		 
		if response.code == "200"
			result = JSON.parse(response.body)
		  
			result["results"].each do |doc|
				firstNameArr.push(doc["user"]["name"]["first"].capitalize)
				lastNameArr.push(doc["user"]["name"]["last"].capitalize)
			end
		else
		  puts "http request error!"
		end
	end
end

fillNames(firstNames, lastNames, nameCount)

#shuffle these a bit
firstNames.shuffle
lastNames.shuffle

firstNames.each_index { |i|  
	puts "#{firstNames[i]} , #{lastNames[i]} #{5.times.map{ 50 + Random.rand(50)}.join(" ")}"
}