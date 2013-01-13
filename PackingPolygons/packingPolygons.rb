class LineSegment
	def initialize(a,b)
		@a = a
		@b = b
	end

	def length #finding length of a line segment
		Math.sqrt( (@b[0]-@a[0]) ** 2 + (@b[1]-@a[1]) ** 2 )
	end
end

class Polygon
	def initialize(vertices)
		@vertices = vertices 
	end

	def can_pack(radius) #checking whether a polygon can be packed within a circle of given radius
		maxD = 0.0
		@vertices.length.times do |i|
			(@vertices.length - i).times do |j|
				if (d = LineSegment.new(@vertices[i],@vertices[i+j]).length) > maxD
					maxD = d
				end
			end
		end	
		if maxD < 2 * radius
			"The polygon can be packed in the circle"
		else
			"There is no way of packing that polygon"
		end
	end
end

#processing the input
infile = File.open("./input.txt")
noOfVertices = infile.readline.to_i
vertices = Array.new
noOfVertices.times do
	a = infile.readline.split
	vertices.push([a[0].to_i,a[1].to_i])
end
radius = infile.readline.to_f
infile.close

#processing the output
myPolygon = Polygon.new(vertices)
outfile = File.open("./output.txt","w")
outfile.write(myPolygon.can_pack(radius))
outfile.close
