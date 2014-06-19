#Solution to [6/14/2014] Challenge #166b

GRAVITY_CONST = 6.67e-11

def weight(objOneMass, objTwoMass, distance)
	return objOneMass * objTwoMass * GRAVITY_CONST / (distance ** 2)
end

class Planet
	attr_reader :name, :radius, :density

	def initialize(name, radius, density)
		@name = name
		@radius = radius.to_i
		@density = density.to_i
	end

	def mass
		return @density * (4 * Math::PI  * (@radius ** 3) / 3)
	end	
end

planets = []

sampleObjMass = gets.chomp.to_i
noOfPlanets = gets.chomp.to_i

noOfPlanets.times do
	tempPlanet = Planet.new(*gets.chomp.split(',').map! {|n| n.strip})
	planets.push(tempPlanet)
end

puts

planets.each do |p|
	objectWeight = weight(sampleObjMass, p.mass, p.radius)
	puts "#{p.name}: #{'%.3f' % objectWeight}"
end