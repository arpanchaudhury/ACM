require 'thread'

class Graph

	def initialize(graph)
		@graph = graph
	end

	def bfs(startnode) # function to find the longest path from a given start node in an acyclic graph
		a = Array.new
		a[startnode] = 0
		queue = Queue.new
		queue.push(startnode)
		endnode = startnode
		while !(queue.empty?)
			node = queue.pop
			@graph[node].each do |x|
				a[x] = a[node]+1
				queue.push(x)
			end
			if a[endnode] != a[node]
				endnode = node
			end
		end
		"The longest path from #{startnode} has length #{a[endnode]}, finishing at #{endnode}"
	end
end

# processing the input
infile = File.open("./input.txt")
nodes = infile.readline.to_i
graph = Hash.new
nodes.times do |i|
	graph[i+1] = []
end
start = infile.readline.to_i
while !(infile.eof?)
	a = infile.readline.split
	graph[a[0].to_i].push(a[1].to_i)
end
infile.close

# processing the output
mygraph = Graph.new(graph)
outfile = File.open("./output.txt","w")
outfile.write(mygraph.bfs(start))

