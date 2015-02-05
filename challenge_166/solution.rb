class HilbertDrawer
	attr_reader :hilbertMap, :degree

	#bitwise mapping layout to Hilbert curve attributed to:
	#http://blog.notdot.net/2009/11/Damn-Cool-Algorithms-Spatial-indexing-with-Quadtrees-and-Hilbert-Curves
	def initialize(degree = 1)
		@degree = degree
		@resFactor = 30
		@hilbertMap =
		{'a' =>
			{
				[0, 0] => [0, 'd'],
				[0, 1] => [1, 'a'],
				[1, 0] => [3, 'b'], 
				[1, 1] => [2, 'a']
			},
		'b' =>
			{
				[0, 0] => [2, 'b'],
				[0, 1] => [1, 'b'],
				[1, 0] => [3, 'a'],
				[1, 1] => [0, 'c']
			},
		'c' =>
			{
				[0, 0] => [2, 'c'],
				[0, 1] => [3, 'd'],
				[1, 0] => [1, 'c'],
				[1, 1] => [0, 'b']
			},
		'd' =>
			{
				[0, 0] => [0, 'a'],
				[0, 1] => [3, 'c'],
				[1, 0] => [1, 'd'],
				[1, 1] => [2, 'd']
			}
		}
	end

	def coordinateToHilbert(x, y)
		#start in the 'base' layout
		currSquare = 'a'
		position = 0


		(@degree - 1).step(0, -1).each{|i|
			position <<= 2 #shift right two bits to allow bitwise ORing upcoming
							#bits. Perfect since 0 << 2 is harmless on the first iteration

			#get most-significant bit from x and y, using |i| to track what
			#bit to look at via bitwise shifting and then getting the ANDed leftmost bit.
			#Each subsequent bit corresponds to a degree, from degree - 1 to 0
			xQuadrant = (x & (1 << i)).to_s(2)[0].to_i == 1 ? 1 : 0
			yQuadrant = (y & (1 << i)).to_s(2)[0].to_i == 1 ? 1 : 0

			#get the ending quadrant position and the next rotation layout to look at based on the
			#rotation map
			quadrantPostion, currSquare = @hilbertMap[currSquare][[xQuadrant, yQuadrant]]

			#append the quadrant position to current position bits via bitwise OR, end result will be
			#the Nth stop at which the given x, y coordinate will be 'visited' by the Hilbert curve.
			position |= quadrantPostion
		}
		return position
	end

	def generateSortedPath()
		outputGrid = []
		#fill in the coordinates for a 2^n by 2^n grid
		(0..2 ** @degree - 1).each do |x|
			(0..2 ** @degree - 1).each do |y|
				outputGrid.push([x, y])
			end
		end

		#sort by Hilbert order
		return outputGrid.sort_by! { |e| self.coordinateToHilbert(e[0], e[1])}
	end

	def outputSVG()
		#create the output array
		return <<-SVG
			\n<svg xmlns="http://www.w3.org/2000/svg" height="#{2 ** @degree * @resFactor}" width="#{2 ** @degree * @resFactor}">
			\n#{self.generateSortedPath.each_cons(2).map{|x, y| "<line x1='#{x[0] * @resFactor}' y1='#{x[1] * @resFactor}' x2='#{y[0] * @resFactor}' y2='#{y[1] * @resFactor}' style=stroke:rgb(0,0,255);stroke-width:'20' />"}.join("\n")}
			\n</svg>
		SVG
	end
end

testHilbert = HilbertDrawer.new(5)
testHilbertOutput = testHilbert.generateSortedPath()
puts testHilbert.outputSVG
