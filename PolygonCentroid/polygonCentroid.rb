class Polygon
	def initialize(vertices)
		@vertices = vertices 
	end
	
	def rearrange
		
	end

	def centroid
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

myPolygon = Polygon.new([[0,1],[1,1],[1,0],[0,0]])
p myPolygon.centroid

