#finding position of a set of points w.r.t a line
def findPointsLeft(point_L,point_R,points)
	points.select do |x,y|
		if (point_R[0]-point_L[0]) * (y-point_L[1]) - (point_R[1]-point_L[1]) * (x -point_L[0]) > 0
			[x,y]
		end	
	end
end

def findPointsRight(point_L,point_R,points)
	points.select do |x,y|
		if (point_R[0]-point_L[0]) * (y-point_L[1]) - (point_R[1]-point_L[1]) * (x -point_L[0]) < 0
			[x,y]		
		end	
	end
end

class Polygon
	def initialize(vertices)
		@vertices = vertices 
	end
	
	def rearrange #arranging points of a polygon in proper order
		@vertices = @vertices.sort_by {|e| e[0]}
		set_L = findPointsLeft(@vertices.first, @vertices.last, @vertices).sort_by {|e| e[0]}	
		set_R = findPointsRight(@vertices.first, @vertices.last, @vertices).sort_by {|e| e[0]}.reverse
		@vertices = [@vertices.first] | set_L | [@vertices.last] | set_R 
		self
	end

	def centroid #finding centroid of a polygon 
		n = @vertices.length	
		area = 0
		centroid_x = 0
		centroid_y = 0
		n.times do |i|
			temp = (@vertices[i%n][0]*@vertices[(i+1)%n][1] - @vertices[(i+1)%n][0]*@vertices[i%n][1])
			area += temp 
			centroid_x += (@vertices[i%n][0] + @vertices[(i+1)%n][0]) * temp
			centroid_y += (@vertices[i%n][1] + @vertices[(i+1)%n][1]) * temp
		end
		area/=2.0
		centroid_x /= (6.0 * area)
		centroid_y /= (6.0 * area)
		[centroid_x.round(3),centroid_y.round(3)]
	end
end

#processing the input
infile = File.open("./input.txt")
noOfVertices = infile.readline.to_i
vertices = Array.new
while !(infile.eof?)
	a = infile.readline.split
	vertices.push([a[0].to_i,a[1].to_i])
end
infile.close

#processing the output
myPolygon = Polygon.new([[-6,-3],[-4,-10],[-4,-4],[-9,-8],[-3,-6],[-7,-12],[-8,-3]])
outfile = File.open("./output.txt","w")
outfile.write(myPolygon.rearrange.centroid)
outfile.close

